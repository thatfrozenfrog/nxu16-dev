#include "libc.h"
#include "classwiz_bsp.h"

class Textbox
{
public:
    byte cursor;
    char buffer[200];

    void Get(byte x, byte y)
    {
        cursor = 0;
        memzero_n((void __near *)buffer, sizeof(buffer));

        while (1)
        {
            auto kc = getkeycode();
            if ((ushort)kc == 0)
            {
                // 忽略无效按键
                continue;
            }

            auto len = strlen(buffer);
            if (kc == KeyCode::Left)
            {
                if (cursor > 0)
                    cursor--;
            }
            else if (kc == KeyCode::Right)
            {
                if (cursor < len)
                    cursor++;
            }
            else if (kc == KeyCode::Delete)
            {
                if (cursor > 0)
                {
                    memmove(&buffer[cursor - 1],&buffer[cursor], len - cursor + 1);
                    cursor--;
                    len--;
                }
            }
            else if (kc == KeyCode::Ok)
            {
                // 完成输入
                return;
            }
            else if (len < sizeof(buffer) - 1)
            {
                // 插入可打印字符
                memmove(&buffer[cursor + 1],&buffer[cursor], len - cursor + 1);
                buffer[cursor] = (char)kc;
                cursor++;
                len++;
            }

            // 更新屏幕
            memzero_n((void __near *)GetScreenBuffer(), 0x7FF);
            
            // 绘制光标
            if (cursor < sizeof(buffer) - 1)
            {
                char temp = buffer[cursor];
                buffer[cursor] = 0x7C;
                line_print((char *)buffer, x, y, x, 180);
                buffer[cursor] = temp;
            }

        }
    }
} g_textbox;

void Textbox_get(byte x, byte y)
{
    g_textbox.Get(x, y);
}