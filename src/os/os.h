#if defined(__ANDROID__)
    #define OS_ANDROID
#elif defined(__linux__)
    #define OS_LINUX
#elif defined(_WIN32) || defined(_WIN64)
    #define OS_WINDOWS
#endif

#if defined(__x86_64__) || defined(__aarch64__)
    #define OS_64
#else
    #define OS_32
#endif


#if defined(OS_WINDOWS)
    #include <Windows.h>
#elif defined(OS_ANDROID)
    
#endif