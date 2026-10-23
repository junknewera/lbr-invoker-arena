function Coroutine_Item(arg0, arg1 = __void, arg2 = undefined) constructor
{
    self.id = arg0;
    self.func = arg1;
    self.active = true;
    self.finished = false;
    self.loop = false;
    self.timer = 0;
    self.timer_end = 0;
    self.timer_duration = 15000;
    
    init = function()
    {
        if (!is_callable(self.func))
        {
            log("Not a coroutine function", self.id);
        }
        variable_struct_set(global.coroutines, self.id, self);
        if (self.active)
        {
            self._start();
        }
    };
    
    check = function()
    {
        if (self.timer > self.timer_end)
        {
            self.set_end_time();
            self.set_inactive();
        }
        else
        {
            self.set_active();
        }
        self.func(self.active, self);
    };
    
    finish = function()
    {
    };
    
    flush = function()
    {
        variable_struct_set(global.coroutines, self.id, undefined);
        variable_struct_remove(global.coroutines, self.id);
        return undefined;
    };
    
    pause = function()
    {
        self.set_inactive();
    };
    
    resume = function()
    {
        self.set_active();
    };
    
    set_active = function()
    {
        self.active = true;
    };
    
    set_inactive = function()
    {
        self.active = false;
    };
    
    set_end_time = function()
    {
        self.timer_end = get_timer() + self.timer_duration;
    };
    
    _start = function()
    {
        self.set_active();
        self.set_end_time();
        self.start();
        self.exec();
    };
    
    start = __void;
    
    _stop = function()
    {
        self.set_inactive();
        self.finished = true;
        self.stop();
    };
    
    stop = __void;
    set_local_vars(arg2);
    init();
}
