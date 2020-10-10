from threading import Lock, Thread
from time import sleep


lock1 = Lock()
lock2 = Lock()

def f():
    with lock1:
        sleep(1)
        with lock2:
            print('f got both locks!')

def g():
    with lock2:
        sleep(1)
        with lock1:
            print('g got both locks!')

thread1 = Thread(target=f)
thread2 = Thread(target=g)

thread1.start()
thread2.start()