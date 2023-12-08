#if defined(__ANDROID__)
    #define OS_ANDROID
#elif defined(__linux__)
    #define OS_LINUX
#elif defined(_WIN32) || defined(_WIN64)
    #define OS_WINDOWS
#elif defined(__EMSCRIPTEN__)
    #define OS_WEB
#elif defined(__APPLE__)
    #define OS_MAC
#endif

#if defined(__x86_64__) || defined(__aarch64__)
    #define OS_64
#else
    #define OS_32
#endif


#if defined(OS_WINDOWS)
    #include <Windows.h>
    #define SOKOL_D3D11
#elif defined(OS_ANDROID) || defined(OS_WEB)
    #define SOKOL_GLES3
#elif defined(OS_MAC)
	#define SOKOL_METAL
#else
    #define SOKOL_GLCORE33
#endif