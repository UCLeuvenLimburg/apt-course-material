class Volatile
{
    public static void main(String[] args)
    {
        sharedVariable = 0;
        flag = false;

        var thread1 = new Thread(Volatile::Writer);
        var thread2 = new Thread(Volatile::Reader);

        thread1.start();
        thread2.start();
    }

    private static int sharedVariable;

    private static volatile boolean flag;

    private static void Writer()
    {
        while ( true )
        {
            sharedVariable++;
            System.out.println(String.format("Thread 1: %d", sharedVariable));
            flag = true;

            while ( flag );
        }
    }

    private static void Reader()
    {
        while ( true )
        {
            while ( !flag );

            sharedVariable++;
            System.out.println(String.format("Thread 2: %d", sharedVariable));
            flag = false;
        }
    }
}