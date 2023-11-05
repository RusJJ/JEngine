LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CPP_EXTENSION     := .cpp .cc
#LOCAL_SHARED_LIBRARIES := 
LOCAL_MODULE            := JoltPhysics
FILE_LIST               := $(wildcard $(LOCAL_PATH)/JoltPhysics/Jolt/*.cpp)
FILE_LIST               += $(wildcard $(LOCAL_PATH)/JoltPhysics/Jolt/*/*.cpp)
FILE_LIST               += $(wildcard $(LOCAL_PATH)/JoltPhysics/Jolt/*/*/*.cpp)
FILE_LIST               += $(wildcard $(LOCAL_PATH)/JoltPhysics/Jolt/*/*/*/*.cpp)
LOCAL_SRC_FILES         := $(FILE_LIST:$(LOCAL_PATH)/%=%)

 ## FLAGS ##
LOCAL_CFLAGS            += -O2 -mfloat-abi=softfp -DNDEBUG -std=c17
LOCAL_CXXFLAGS          += -O2 -mfloat-abi=softfp -DNDEBUG -std=c++17
LOCAL_LDLIBS            += -llog -ldl -landroid
LOCAL_C_INCLUDES 		+= $(LOCAL_PATH)/JoltPhysics

 ## BUILD ##
include $(BUILD_SHARED_LIBRARY)