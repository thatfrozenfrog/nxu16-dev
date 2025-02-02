
#include "libc.h"
#include "classwiz_bsp.h"
#include "plugin/printlib.h"
class MenuItem
{
public:
    ushort op;
    const char *string;
};

const MenuItem test_menu[] = {
    {0, "Get 180 free"},
    {0, "pulls On"},
    {0, "Genshit(TM)"},
    {1, "Yes1"},
    {2, "Yes2"},
    {3, "Yes3"},
    {4, "Yes4"},
    {5, "Yes5"},
    {6, "Yes6"},
    {7, "Yes7"},
    {8, "Yes8"},
    {9, "Yes9"},
    {10, "Yes10"},
    {11, "Yes11"},
};

ushort show_menu(const MenuItem *pmenuitems, byte count);
template <byte N>
/*
brief: Show a menu with a list of items
param: pmenuitems: A pointer to the struct MenuItem
param: count: The number of items in the menu
return: The index of the selected item
*/
ushort show_menu(const MenuItem (&pmenuitems)[N])
{
    return show_menu(pmenuitems, static_cast<byte>(N - 1));
}