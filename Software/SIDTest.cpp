int v = [0,7,14];

// Setup ADSR, Pulse Wave, Beginning Frequency
for(int i = 0; i < 3; i++)
{
    mySid.poke(v(i)+3,8);
    mySid.poke(v(i)+1,0);
    mySid.poke(v(i)+5,8);
    mySid.poke(v(i)+6,198);
}

// For each voice
for(int a = 16; a < 129; a = a + 16)
{
    for(int i = 0; i < 3; i++)
    {
        // Set pulse width to 0
        if(a>64)
            mySid.poke(v(i)+3,0);
        
        // Set shape
        mySid.poke(v(i)+4,a+1);

        // Sweep Frequency
        for(int f = 0; f < 255; f = f+2)
        {
            mySid.poke(v(i)+1,f);
        }  

        // Set shape   
        mySid.poke(v(i)+4,a);

        delay(100) // W = 0 to 200

        // Set test bit to 1
        mySid.poke(v(i)+4,8);

        // Freq high byte to 0
        mySid.poke(v(i)+1,0);
    }
}

int a = 1


// Filter Test
while(a < 8)
{
    // All three filter types
    for(int i = 0; i < 3; i++)
    {
        mySid.poke(v(i)+1,255);
        mySid.poke(24,(a*16)+15);
        mySid.poke(23,pow(2,i));
        mySid.poke(v(i)+4,129);
        for(int f = 0; f < 256; i++)
        {
             mySid.poke(22,f);
        }      
        mySid.poke(v(i)+4,136);
    }
    a = a*2:
}
