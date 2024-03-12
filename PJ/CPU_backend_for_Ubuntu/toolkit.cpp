int ChartoInt(char c)
{
    switch (c)
    {
    case 'a':
        return 10;
    case 'b':
        return 11;
    case 'c':
        return 12;
    case 'd':
        return 13;
    case 'e':
        return 14;
    case 'f':
        return 15;
    default:
        return (c - '0');
    }
}

long long ChartoLL(char c)
{
    switch (c)
    {
    case 'a':
        return 10;
    case 'b':
        return 11;
    case 'c':
        return 12;
    case 'd':
        return 13;
    case 'e':
        return 14;
    case 'f':
        return 15;
    default:
        return (c - '0');
    }
}

long long StringtoLL(char *p)
{
    long long valC = 0;
    valC |= ChartoLL(p[1]);
    valC |= (ChartoLL(p[0]) << 4);
    valC |= (ChartoLL(p[3]) << 8);
    valC |= (ChartoLL(p[2]) << 12);
    valC |= (ChartoLL(p[5]) << 16);
    valC |= (ChartoLL(p[4]) << 20);
    valC |= (ChartoLL(p[7]) << 24);
    valC |= (ChartoLL(p[6]) << 28);
    valC |= (ChartoLL(p[9]) << 32);
    valC |= (ChartoLL(p[8]) << 36);
    valC |= (ChartoLL(p[11]) << 40);
    valC |= (ChartoLL(p[10]) << 44);
    valC |= (ChartoLL(p[13]) << 48);
    valC |= (ChartoLL(p[12]) << 52);
    valC |= (ChartoLL(p[15]) << 56);
    switch (ChartoLL(p[14]))
    {
    case 15:
        valC |= 1LL << 62;
    case 11:
        valC |= 1LL << 61;
    case 9:
        valC |= 1LL << 60;
    case 8:
        valC -= 1LL << 63;
        break;
    case 14:
        valC |= 1LL << 62;
    case 10:
        valC |= 1LL << 61;
        valC -= 1LL << 63;
        break;
    case 13:
        valC |= 1LL << 60;
    case 12:
        valC |= 1LL << 62;
        valC -= 1LL << 63;
    default:
        valC |= ChartoLL(p[14]) << 60;
        break;
    }

    return valC;
}

void LLtoString(char *str, long long val)
{
    char trans[17] = "0123456789abcdef";
    bool flag = false;
    if (val == -1)
    {
        for (int i = 0; i < 16; i++)
            str[i] = 'f';
        return;
    }
    if (val < -1)
    {
        flag = true;
        val = -val - 1;
    }

    for (int i = 0; i < 16; i += 2)
    {
        str[i+1] = trans[val % 16];
        val /= 16;
        str[i] = trans[val % 16];
        val /= 16;
    }

    if (flag)
        for (int i = 0; i < 16; i++)
            str[i] = trans['f' - str[i]];
}
