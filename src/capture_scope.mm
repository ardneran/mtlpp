/*
 * Copyright 2016-2017 Nikolay Aleksiev. All rights reserved.
 * License: https://github.com/naleksiev/mtlpp/blob/master/LICENSE
 */

#include "capture_scope.hpp"
#include <Metal/MTLCaptureScope.h>

namespace mtlpp
{
    CommandQueue CaptureScope::GetCommandQueue() const
    {
        Validate();
        return ns::Handle { (__bridge void*)[(__bridge id<MTLCaptureScope>)m_ptr commandQueue] };
    }

    Device CaptureScope::GetDevice() const
    {
        Validate();
        return ns::Handle { (__bridge void*)[(__bridge id<MTLCaptureScope>)m_ptr device] };
    }

    ns::String CaptureScope::GetLabel() const
    {
        Validate();
        return ns::Handle{ (__bridge void*)[(__bridge id<MTLCaptureScope>)m_ptr label] };
    }

    void CaptureScope::BeginScope()
    {
        Validate();
        [(__bridge id<MTLCaptureScope>)m_ptr beginScope];
    }

    void CaptureScope::EndScope()
    {
        Validate();
        [(__bridge id<MTLCaptureScope>)m_ptr endScope];
    }
}
