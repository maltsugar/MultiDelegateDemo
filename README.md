使用本demo的桥接对象
或者 
NSPointerArray



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
