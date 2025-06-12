import threading


class SingletonMeta(type):
    """
    单例模式的元类实现（线程安全版）
    """
    _instance = {}
    _lock = threading.Lock()

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instance:
            with cls._lock:
                if cls not in cls._instance:
                    instance = super().__call__(*args, **kwargs)
                    cls._instance[cls] = instance
        return cls._instance[cls]


class Test(metaclass=SingletonMeta):
    pass


test1 = Test()
test2 = Test()
print(test1 is test2)

