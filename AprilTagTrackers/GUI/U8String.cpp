#include "U8String.h"

#include <wx/string.h>

U8String::operator wxString() const
{
    return wxString::FromUTF8Unchecked(str);
}

U8StringView::operator wxString() const
{
    return wxString::FromUTF8Unchecked(str.data(), str.size());
}
