enum 50402 "Passport Status"
{
    Extensible = true;

    value(0; Open)
    {
    }
    value(1; Active)
    {
        Caption = 'Active';
    }
    value(2; "Released")
    {
        caption = 'Released';
    }
    value(3; Blocked)
    {
        caption = 'Blocked';
    }
    value(4; "Recalled")
    {
        Caption = 'Recalled';
    }
    value(5; "Closed")
    {
        Caption = 'closed';
    }
}