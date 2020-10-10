class Volatile
{
    public static void main(String[] args)
    {
        sharedVariable = 0;

        var thread1 = new Thread(Volatile::Writer);
        var thread2 = new Thread(Volatile::Reader);

        thread1.start();
        thread2.start();
    }

    private static volatile int sharedVariable;

    private static void Writer()
    {
        while ( true )
        {
            sharedVariable++;
            System.out.println(sharedVariable);

            while ( sharedVariable % 2 != 0 );
        }
    }

    private static void Reader()
    {
        while ( true )
        {
            sharedVariable++;
            System.out.println(sharedVariable);

            while ( sharedVariable % 2 == 0 );
        }
    }
}