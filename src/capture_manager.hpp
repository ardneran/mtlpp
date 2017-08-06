/*
 * Copyright 2016-2017 Nikolay Aleksiev. All rights reserved.
 * License: https://github.com/naleksiev/mtlpp/blob/master/LICENSE
 */

#pragma once

#include "defines.hpp"

namespace mtlpp
{
    class CaptureScope;
    class CommandQueue;
    class Device;

    class CaptureManager : public ns::Object
    {
    public:
        CaptureManager() { }
        CaptureManager(const ns::Handle& handle) : ns::Object(handle) { }

        static CaptureManager GetSharedCaptureManager();

        CaptureScope NewCaptureScope(Device device);
        CaptureScope NewCaptureScope(CommandQueue commandQueue);

        CaptureScope GetDefaultCaptureScope();
        void SetDefaultCaptureScope(CaptureScope captureScope);

        void StartCapture(Device device);
        void StartCapture(CommandQueue commandQueue);
        void StartCapture(CaptureScope CaptureScope);
        void StopCapture();

        bool IsCapturing();
    }
    MTLPP_AVAILABLE(10_13, 11_0);
}
