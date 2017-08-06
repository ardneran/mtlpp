/*
 * Copyright 2016-2017 Nikolay Aleksiev. All rights reserved.
 * License: https://github.com/naleksiev/mtlpp/blob/master/LICENSE
 */

#pragma once

#include "defines.hpp"

namespace mtlpp
{
    class CommandQueue;
    class Device;

    class CaptureScope : public ns::Object
    {
    public:
        CaptureScope() { }
        CaptureScope(const ns::Handle& handle) : ns::Object(handle) { }

        CommandQueue    GetCommandQueue() const;
        Device          GetDevice() const;
        ns::String      GetLabel() const;

        void BeginScope();
        void EndScope();
    }
    MTLPP_AVAILABLE(10_13, 11_0);
}
