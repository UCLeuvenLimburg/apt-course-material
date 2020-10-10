class NonVolatile
{
    public static void main(String[] args)
    {
        sharedVariable = 0;

        var thread1 = new Thread(NonVolatile::Writer);
        var thread2 = new Thread(NonVolatile::Reader);

        thread1.start();
        thread2.start();
    }

    private static int sharedVariable;

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