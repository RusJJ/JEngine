LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CPP_EXTENSION     := .cpp .cc
#LOCAL_SHARED_LIBRARIES := 
LOCAL_MODULE            := JEngine
LOCAL_SRC_FILES         := main.cpp

 ## FLAGS ##
LOCAL_CFLAGS            += -O2 -mfloat-abi=softfp -DNDEBUG -std=c17
LOCAL_CXXFLAGS          += -O2 -mfloat-abi=softfp -DNDEBUG -std=c++17
LOCAL_LDLIBS            += -llog -ldl -landroid

 ## BUILD ##
include $(BUILD_SHARED_LIBRARY)