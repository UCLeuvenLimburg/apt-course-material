class VolatileSync2
{
    public static void main(String[] args)
    {
        sharedVariable = 0;

        var thread1 = new Thread(VolatileSync2::Writer);
        var thread2 = new Thread(VolatileSync2::Reader);

        thread1.start();
        thread2.start();
    }

    private static volatile int sharedVariable;

    private static void Writer()
    {
        while ( true )
        {

            synchronized (System.out)
            {
                sharedVariable++;
                System.out.println(sharedVariable);
            }

            while ( sharedVariable % 2 != 0 );
        }
    }

    private static void Reader()
    {
        while ( true )
        {
            sharedVariable++;

            synchronized (System.out)
            {
                System.out.println(sharedVariable);
            }

            while ( sharedVariable % 2 == 0 );
        }
    }
}