
#define ABS(a) ((a) < 0 ? -(a) : (a))

// ==== ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ ====

char GAMEMODE = 0; // 0 – черные, 1 – белые

// Позиции шашек (индексы 0–11: черные, 12–23: белые)
char checkerX[24] = {0, 2, 4, 6, 1, 3, 5, 7, 0, 2, 4, 6, 1, 3, 5, 7, 0, 2, 4, 6, 1, 3, 5, 7};
char checkerY[24] = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7};
char checkerIsKing[24] = {0};
char checkerIsAlive[24] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

// Индексная таблица: по координатам – индекс в массивах шашек или -1
char TABLE_INDEX[8][8] = {
    {0, -1, 1, -1, 2, -1, 3, -1},
    {-1, 4, -1, 5, -1, 6, -1, 7},
    {8, -1, 9, -1, 10, -1, 11, -1},
    {-1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1, -1, -1},
    {-1, 12, -1, 13, -1, 14, -1, 15},
    {16, -1, 17, -1, 18, -1, 19, -1},
    {-1, 20, -1, 21, -1, 22, -1, 23},
};

// Смещение по X для диагональных ходов
const char dirX[2] = {-1, +1};

// Счётчики оставшихся шашек
char countCapture[2] = {12, 12};

// Флаги состояния для игрового цикла
char canContinueCapture = 0;

// Переменные для работы с хэш-таблицей расстановок
#define TT_SIZE 256             // Небольшая таблица
unsigned char tt_hash[TT_SIZE]; // Простое хеширование
char tt_depth[TT_SIZE];
int tt_score[TT_SIZE];

// Вспомогательные переменные (используются внутри разных функций)
char id, midX, midY, dirY, backDirY, startX, startY, newX, newY;
char enemyIndex, startIdx, endIdx, curColor, checkCount;
char tx, ty, x1, x2, y1, y2, wasKing, color, lastCap, moveCount;
char moves[64];
int bestScore;
char bestMoveId;
char packedStart;
char packedEnd;
char inf;
char cap;
char key, val1, val2, val3;

// Глубина MiniMax
char DEPTH = 1;
// Предвычисленные значения для материала
char PAWN_VALUE = 10;
char KING_VALUE = 30;

// Предвычисленные значения для позиции (расстояние от края)
char POS_VALUE[8] = {0, 1, 2, 3, 3, 2, 1, 0};
int score;
int blackMaterial;
int whiteMaterial;

// Буфферный массив для сортировки
char temp[4];

// Переменные для обработки данных на выход
int LINES[3];
char checkersLine[4];
char cntLine;
char swift;

// ==== КОДЫ ДЛЯ АППАРАТНОЙ ЧАСТИ ====

int MOVE = 0x7ff1;
int HASCAPTURE = 0x7ff2;
int WIN = 0x7ff3;
int LOSE = 0x7ff4;
int CONTINUEP = 0x7ff5;
int CONTINUEB = 0x7ff6;
int FINALBOT = 0x7ff7;
int DRAW = 0x7ff8;

// ==== ФУНКЦИИ УПАКОВКИ/РАСПАКОВКИ ====

static inline char packCoords(char x, char y)
{
    return (x << 4) | (y & 0x0F);
}

static inline char unpackX(char p)
{
    return (p >> 4) & 0x0F;
}

static inline char unpackY(char p)
{
    return p & 0x0F;
}

static inline char packCaptureInfo(char capId, char wasKing)
{
    return (capId << 1) | (wasKing & 0x01);
}

static inline char getCaptureId(char info)
{
    return (info >> 1) & 0x7FFF;
}

static inline char getWasKing(char info)
{
    return info & 0x01;
}
static inline int pack_pair(char low, char high)
{
    return ((low & 0x7) << 3) | ((high & 0x7));
}

static inline int pack_word(char pair01, char pair23, char x)
{
    return (pair23 << 4) | (pair01 << 10) | ((x & 0xF));
}
// ==== РАБОТА С ТАБЛИЦЕЙ ====

unsigned char getHashKey()
{
    key = 0;
    for (char i = 0; i < 24; i++)
    {
        if (checkerIsAlive[i])
        {
            // Заменяем (i+1)*(checkerX[i]+1)*(checkerY[i]+1) на XOR и сдвиги
            val1 = (i + 1);
            val2 = (checkerX[i] + 1);
            val3 = (checkerY[i] + 1);

            // Используем XOR и сдвиги вместо умножения
            key ^= (val1 << 5) ^ (val2 << 3) ^ val3;
        }
    }
    // Используем маску вместо модуля для степеней двойки
    return key & (TT_SIZE - 1);
}

// ==== ПРОВЕРКА ВОЗМОЖНОСТИ ЗАХВАТА ====

char hasCapture(char x, char y, char color)
{
    dirY = (color == 0) ? +1 : -1;
    // обычный захват
    for (char i = 0; i < 2; i++)
    {
        midX = x + dirX[i], midY = y + dirY;

        if (midX < 0 || midX >= 8 || midY < 0 || midY >= 8)
            continue;

        enemyIndex = TABLE_INDEX[midY][midX];

        if (enemyIndex < 0 ||
            (color == 0 && enemyIndex < 12) ||
            (color == 1 && enemyIndex >= 12))
            continue;

        tx = x + (dirX[i] << 1), ty = y + (dirY << 1);

        if (tx < 0 || tx >= 8 || ty < 0 || ty >= 8)
            continue;
        if (TABLE_INDEX[ty][tx] == -1)
            return 1;
    }
    // для дамок обратным ходом
    id = TABLE_INDEX[y][x];
    if (id >= 0 && checkerIsKing[id])
    {
        dirY = -dirY;
        for (char i = 0; i < 2; i++)
        {
            midX = x + dirX[i], midY = y + dirY;
            if (midX < 0 || midX >= 8 || midY < 0 || midY >= 8)
                continue;
            enemyIndex = TABLE_INDEX[midY][midX];
            if (enemyIndex < 0 ||
                (color == 0 && enemyIndex < 12) ||
                (color == 1 && enemyIndex >= 12))
                continue;
            tx = x + (dirX[i] << 1), ty = y + (dirY << 1);
            if (tx < 0 || tx >= 8 || ty < 0 || ty >= 8)
                continue;
            if (TABLE_INDEX[ty][tx] == -1)
                return 1;
        }
    }
    return 0;
}
// Проверка наличия в целом взятия за игрока, для работы аппаратной части
char hasAllCapture()
{
    for (int i = 0; i < 12; i++)
    {
        if (hasCapture(checkerX[i], checkerY[i], 0))
        {
            return 1;
        }
    }

    return 0;
}

// ==== ХОД И ОТКАТ ====

char move(char pStart, char pEnd)
{
    x1 = unpackX(pStart);
    y1 = unpackY(pStart);
    x2 = unpackX(pEnd);
    y2 = unpackY(pEnd);
    id = TABLE_INDEX[y1][x1];
    wasKing = checkerIsKing[id];
    color = (id < 12) ? 0 : 1;
    lastCap = -1;

    if (ABS(y2 - y1) == 1 && ABS(x2 - x1) == 1)
    {
        // просто ход
        checkerX[id] = x2;
        checkerY[id] = y2;
        TABLE_INDEX[y2][x2] = id;
        TABLE_INDEX[y1][x1] = -1;
    }
    else if (ABS(y2 - y1) == 2 && ABS(x2 - x1) == 2)
    {
        // захват
        midX = ((x1 + x2) >> 1) & 0x7FFF;
        midY = ((y1 + y2) >> 1) & 0x7FFF;

        lastCap = TABLE_INDEX[midY][midX];
        checkerIsAlive[lastCap] = 0;
        checkerX[lastCap] = checkerY[lastCap] = -1;
        checkerX[id] = x2;
        checkerY[id] = y2;

        TABLE_INDEX[y2][x2] = id;
        TABLE_INDEX[y1][x1] = TABLE_INDEX[midY][midX] = -1;
        canContinueCapture = hasCapture(x2, y2, color);
    }
    // коронация
    if ((id < 12 && y2 == 7) || (id >= 12 && y2 == 0))
    {
        checkerIsKing[id] = 1;
    }
    return packCaptureInfo(lastCap, wasKing);
}
void undoMove(char pStart, char pEnd, char info)
{
    x1 = unpackX(pStart);
    y1 = unpackY(pStart);
    x2 = unpackX(pEnd);
    y2 = unpackY(pEnd);
    char lastCap = getCaptureId(info);
    char wasKing = getWasKing(info);

    id = TABLE_INDEX[y2][x2];
    checkerX[id] = x1;
    checkerY[id] = y1;
    TABLE_INDEX[y1][x1] = id;
    TABLE_INDEX[y2][x2] = -1;
    checkerIsKing[id] = wasKing;

    if (lastCap >= 0)
    {
        midX = ((x1 + x2) >> 1) & 0x7FFF;

        midY = ((y1 + y2) >> 1) & 0x7FFF;

        checkerIsAlive[lastCap] = 1;
        checkerX[lastCap] = midX;
        checkerY[lastCap] = midY;
        TABLE_INDEX[midY][midX] = lastCap;
    }
}
// ==== ПОИСК ВОЗМОЖНЫХ ХОДОВ ====

void checkCapture(char dirX, char dirY, char moves[])
{
    midX = startX + dirX;
    midY = startY + dirY;
    if (midX < 0 || midX >= 8 || midY < 0 || midY >= 8)
        return;
    enemyIndex = TABLE_INDEX[midY][midX];
    if (enemyIndex < 0 ||
        (curColor == 0 && enemyIndex < 12) ||
        (curColor == 1 && enemyIndex >= 12))
        return;
    newX = startX + (dirX << 1);
    newY = startY + (dirY << 1);
    if (newX < 0 || newX >= 8 || newY < 0 || newY >= 8 ||
        TABLE_INDEX[newY][newX] != -1)
        return;

    id = checkCount << 2;
    moves[id + 0] = 'a' + startX;
    moves[id + 1] = '1' + startY;
    moves[id + 2] = 'a' + newX;
    moves[id + 3] = '1' + newY;
    checkCount++;
}

void checkMove(char dirX, char dirY, char moves[])
{
    newX = startX + dirX;
    newY = startY + dirY;
    if (newX < 0 || newX >= 8 || newY < 0 || newY >= 8 ||
        TABLE_INDEX[newY][newX] != -1)
        return;

    id = checkCount << 2;
    moves[id + 0] = 'a' + startX;
    moves[id + 1] = '1' + startY;
    moves[id + 2] = 'a' + newX;
    moves[id + 3] = '1' + newY;
    checkCount++;
}

char getMoves(char color, char moves[])
{
    curColor = color;
    checkCount = 0;
    if (color == 0)
    {
        startIdx = 0;
        endIdx = 12;
        dirY = +1;
        backDirY = -1;
    }
    else
    {
        startIdx = 12;
        endIdx = 24;
        dirY = -1;
        backDirY = +1;
    }

    // сначала захваты
    for (char i = startIdx; i < endIdx; i++)
    {
        if (!checkerIsAlive[i])
            continue;
        startX = checkerX[i];
        startY = checkerY[i];
        for (char j = 0; j < 2; j++)
            checkCapture(dirX[j], dirY, moves);
        if (checkerIsKing[i])
            checkCapture(dirX[0], backDirY, moves),
                checkCapture(dirX[1], backDirY, moves);
    }
    if (checkCount)
        return checkCount;

    // если нет захватов — простые ходы
    for (char i = startIdx; i < endIdx; i++)
    {
        if (!checkerIsAlive[i])
            continue;
        startX = checkerX[i];
        startY = checkerY[i];
        for (char j = 0; j < 2; j++)
            checkMove(dirX[j], dirY, moves);
        if (checkerIsKing[i])
            checkMove(dirX[0], backDirY, moves),
                checkMove(dirX[1], backDirY, moves);
    }
    return checkCount;
}

// ==== ОЦЕНКА И MINIMAX ====

int evaluateBoard(char color)
{

    score = 0;
    blackMaterial = 0;
    whiteMaterial = 0;

    // Быстрый выход при очевидных позициях
    if (countCapture[0] == 0)
        return -100;
    if (countCapture[1] == 0)
        return 100;

    for (char i = 0; i < 12; i++)
    {
        if (checkerIsAlive[i])
        {
            blackMaterial += PAWN_VALUE + (checkerIsKing[i] ? (KING_VALUE - PAWN_VALUE) : 0);
            // Бонус за позицию
            blackMaterial += POS_VALUE[checkerX[i]] + POS_VALUE[checkerY[i]];
            // Бонус за продвижение к дамкам
            if (!checkerIsKing[i])
                blackMaterial += checkerY[i];
        }
    }

    for (char i = 12; i < 24; i++)
    {
        if (checkerIsAlive[i])
        {
            whiteMaterial += PAWN_VALUE + (checkerIsKing[i] ? (KING_VALUE - PAWN_VALUE) : 0);
            // Бонус за позицию
            whiteMaterial += POS_VALUE[checkerX[i]] + POS_VALUE[checkerY[i]];
            // Бонус за продвижение к дамкам
            if (!checkerIsKing[i])
                whiteMaterial += (7 - checkerY[i]);
        }
    }

    score = blackMaterial - whiteMaterial;
    return color == 0 ? score : -score;
}
char scoreMove(char *move, char color)
{
    x1 = move[0] - 'a';
    y1 = move[1] - '1';
    x2 = move[2] - 'a';
    y2 = move[3] - '1';

    // Взятия всегда в приоритете
    if (ABS(x2 - x1) == 2)
        return 100;

    // Движение к дамкам
    if ((TABLE_INDEX[y1][x1] < 12 && y2 > 5) ||
        (TABLE_INDEX[y1][x1] >= 12 && y2 < 2))
        return 50;

    // Движение к центру
    return (3 - ABS(x2 - 3)) + (3 - ABS(y2 - 3));
}

void sortMoves(char *moves, char moveCount, char color)
{
    for (char i = 0; i < moveCount - 1; i++)
    {
        for (char j = 0; j < moveCount - i - 1; j++)
        {
            if (scoreMove(&moves[j * 4], color) < scoreMove(&moves[(j + 1) * 4], color))
            {
                // Обмен ходов

                for (char k = 0; k < 4; k++)
                    temp[k] = moves[j * 4 + k];
                for (char k = 0; k < 4; k++)
                    moves[j * 4 + k] = moves[(j + 1) * 4 + k];
                for (char k = 0; k < 4; k++)
                    moves[(j + 1) * 4 + k] = temp[k];
            }
        }
    }
}
int minimax(char depth, char color, int alpha, int beta)
{
    unsigned key = getHashKey();
    if (tt_hash[key] == key && tt_depth[key] >= depth)
        return tt_score[key];

    if (depth <= 0)
        return evaluateBoard(color);

    char moves[64];
    char moveCount = getMoves(color, moves);
    sortMoves(moves, moveCount, color);

    int bestScore = (color == 0) ? -100 : +100;

    for (int i = 0; i < moveCount; i++)
    {
        char x1 = moves[i * 4 + 0] - 'a';
        char y1 = moves[i * 4 + 1] - '1';
        char x2 = moves[i * 4 + 2] - 'a';
        char y2 = moves[i * 4 + 3] - '1';
        char packedStart = packCoords(x1, y1), packedEnd = packCoords(x2, y2);
        char inf = move(packedStart, packedEnd);

        int sc = minimax(depth - 1, 1 - color, alpha, beta);
        undoMove(packedStart, packedEnd, inf);

        if (color == 0)
        {
            if (sc > bestScore)
                bestScore = sc;
            if (sc > alpha)
                alpha = sc;
        }
        else
        {
            if (sc < bestScore)
                bestScore = sc;
            if (sc < beta)
                beta = sc;
        }
        if (beta <= alpha)
            break;
    }
    tt_hash[key] = key;
    tt_depth[key] = depth;
    tt_score[key] = bestScore;
    return bestScore;
}

// ==== ОБРАБОТКА ДАННЫХ НА ВЫХОД ====

// Обновление линий для вывода с процессора
void updateLines(char pStart, char pEnd)
{
    char y1 = unpackY(pStart);
    char y2 = unpackY(pEnd);

    cntLine = ABS(y1 - y2) + 1;
    if (y2 < y1)
    {
        for (int i = y1; i > y1 - cntLine; i--)
        {
            swift = i % 2 ? 1 : 0;
            for (int j = 0; j < 4; j++)
            {
                id = TABLE_INDEX[i][j * 2 + swift];

                if (id >= 0)
                {
                    checkersLine[j] = ((id < 12) ? (checkerIsKing[id] ? 2 : 0) : (checkerIsKing[id] ? 3 : 1)) + 1;
                }
                else
                {
                    checkersLine[j] = 0;
                }
            }
            LINES[y1 - i] = pack_word(pack_pair(checkersLine[0], checkersLine[1]), pack_pair(checkersLine[2], checkersLine[3]), i);
        }
    }
    if (cntLine == 2)
    {
        LINES[2] = LINES[1];
    }
}

// ==== ХОД БОТА ====
void checkSituation()
{
    if (countCapture[0] < countCapture[1])
    {
        // Здесь возвращаем код LOSE

        return;
    }
    if (countCapture[0] > countCapture[1])
    {
        // Здесь возвращаем код WIN

        return;
    }
    // Здесь возвращаем код DRAW

    return;
}
void botMove(void)
{
    char moves[64];
    moveCount = getMoves(1, moves);
    if (moveCount == 0)
    {
        checkSituation();
        return;
    }
    if (moveCount == 1)
    {
        // Если только один ход, сделать его сразу
        x1 = moves[0] - 'a';
        y1 = moves[1] - '1';
        x2 = moves[2] - 'a';
        y2 = moves[3] - '1';
        packedStart = packCoords(x1, y1), packedEnd = packCoords(x2, y2);
        inf = move(packedStart, packedEnd);
        cap = getCaptureId(inf);
        if (cap >= 0)
            countCapture[cap < 12 ? 0 : 1]--;
        updateLines(packedStart, packedEnd);
        return;
    }
    sortMoves(moves, moveCount, 1);
    int bestScore = +100;
    char bestId = 0;
    for (int i = 0; i < moveCount; i++)
    {
        char x1 = moves[i * 4 + 0] - 'a';
        char y1 = moves[i * 4 + 1] - '1';
        char x2 = moves[i * 4 + 2] - 'a';
        char y2 = moves[i * 4 + 3] - '1';
        char packedStart = packCoords(x1, y1), packedEnd = packCoords(x2, y2);
        char inf = move(packedStart, packedEnd);

        int sc = minimax(DEPTH, 0, -100, 100);
        undoMove(packedStart, packedEnd, inf);

        if (sc < bestScore)
        {
            bestScore = sc;
            bestId = i;
        }
    }
    // выполняем лучший
    x1 = moves[bestId * 4 + 0] - 'a';
    y1 = moves[bestId * 4 + 1] - '1';
    x2 = moves[bestId * 4 + 2] - 'a';
    y2 = moves[bestId * 4 + 3] - '1';
    packedStart = packCoords(x1, y1), packedEnd = packCoords(x2, y2);
    inf = move(packedStart, packedEnd);
    cap = getCaptureId(inf);
    if (cap >= 0)
    {
        countCapture[cap < 12 ? 0 : 1]--;
    }
    updateLines(packedStart, packedEnd);
}

// ==== ПАРСЕР ХОДОВ ПОЛЬЗОВАТЕЛЯ ====

void playerMove()
{

    packedStart = packCoords(x1, y1);
    packedEnd = packCoords(x2, y2);
    inf = move(packedStart, packedEnd);
    cap = getCaptureId(inf);
    if (cap >= 0)
        countCapture[cap < 12 ? 0 : 1]--;
}

// ==== MAIN LOOP ====

int main(void)
{
    GAMEMODE = 0; // Черные начинают
    while (1)
    {
        canContinueCapture = 1;
        if (GAMEMODE == 0)
        { // Ход черных (игрок)
            while (canContinueCapture)
            {
                // Здесь возвращаем код MOVE
                canContinueCapture = 0;
                // Берем координаты хода из входимых данных из аппаратной части
                playerMove();
                if (canContinueCapture)
                {
                    // Здесь возвращаем код CONTINUEP
                }
            }
            GAMEMODE = 1; // Следующий ход за белыми (ботом)
        }
        else
        { // Ход белых (бот)
            while (canContinueCapture)
            {
                canContinueCapture = 0;
                // Бот выбирает лучший ход с помощью минимакс
                botMove(); // Функция для выполнения хода бота
                if (canContinueCapture)
                {
                    // Здесь возвращаем код CONTINUEB и данные из LINES загружаем в регистры 1,2,3
                }
                else
                {
                    if (hasAllCapture())
                    {
                        // Здесь возвращаем код HASCAPTURE и данные из LINES загружаем в регистры 1,2,3
                    }
                    else
                    {
                        // Здесь возвращаем код FINALBOT и данные из LINES загружаем в регистры 1,2,3
                    }
                }
            }
            GAMEMODE = 0; // Следующий ход за черными (игроком)
        }
        if (countCapture[0] == 0)
        {
            // Здесь возвращаем код LOSE
            break;
        }
        if (countCapture[1] == 0)
        {
            // Здесь возвращаем код WIN
            break;
        }
    }
    return 0;
}