使用本demo的桥接对象

或者 

NSPointerArray

同样的:NSMapTable对应NSDictionary,NSHashTable对应NSSet


```
- (void)addDelegate:(id<YDVideoManagerDelegate>)delegate
{
    [self.delegates addPointer:(void *)delegate];
}

- (void)notifyDelegateProgressUpdated {
    for (id delegate in self.delegates) {
        
        if (!delegate) {
            continue;
        }
        if ([delegate respondsToSelector:@selector(didChangeUploadProgress)]) {
            [delegate didChangeUploadProgress];
        }
    }
}


- (NSPointerArray *)delegates
{
    if (!_delegates) {
        _delegates = [NSPointerArray weakObjectsPointerArray];
    }
    return _delegates;
}
```
