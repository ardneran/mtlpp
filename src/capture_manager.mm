/*
 * Copyright 2016-2017 Nikolay Aleksiev. All rights reserved.
 * License: https://github.com/naleksiev/mtlpp/blob/master/LICENSE
 */

#include "capture_manager.hpp"
#include <Metal/MTLCaptureManager.h>

namespace mtlpp
{
    CaptureManager CaptureManager::GetSharedCaptureManager()
    {
        return ns::Handle{ (__bridge void*)[MTLCaptureManager sharedCaptureManager] };
    }

    CaptureScope CaptureManager::NewCaptureScope(Device device)
    {
        Validate();
        return ns::Handle{ (__bridge void*) [(__bridge MTLCaptureManager*)m_ptr newCaptureScopeWithDevice:(__bridge id<MTLDevice>)device.GetPtr()] };
    }

    CaptureScope CaptureManager::NewCaptureScope(CommandQueue commandQueue)
    {
        Validate();
        return ns::Handle{ (__bridge void*) [(__bridge MTLCaptureManager*)m_ptr newCaptureScopeWithCommandQueue:(__bridge id<MTLCommandQueue>)commandQueue.GetPtr()] };
    }

    CaptureScope CaptureManager::GetDefaultCaptureScope()
    {
        Validate();
        return ns::Handle{ (__bridge void*) [(__bridge MTLCaptureManager*)m_ptr defaultCaptureScope] };
    }

    void CaptureManager::SetDefaultCaptureScope(CaptureScope captureScope)
    {
        Validate();
        [(__bridge MTLCaptureManager*)m_ptr setDefaultCaptureScope:(__bridge id<MTLCaptureScope>)captureScope.GetPtr()];
    }

    void CaptureManager::StartCapture(Device device)
    {
        Validate();
        [(__bridge MTLCaptureManager*)m_ptr startCaptureWithDevice:(__bridge id<MTLDevice>)device.GetPtr()];
    }

    void CaptureManager::StartCapture(CommandQueue commandQueue)
    {
        Validate();
        [(__bridge MTLCaptureManager*)m_ptr startCaptureWithCommandQueue:(__bridge id<MTLCommandQueue>)commandQueue.GetPtr()];
	}

    void CaptureManager::StartCapture(CaptureScope captureScope)
    {
        Validate();
        [(__bridge MTLCaptureManager*)m_ptr startCaptureWithScope:(__bridge id<MTLCaptureScope>)captureScope.GetPtr()];
	}

    void CaptureManager::StopCapture()
    {
        Validate();
        [(__bridge MTLCaptureManager*)m_ptr stopCapture];
    }

    bool CaptureManager::IsCapturing()
    {
        Validate();
        return [(__bridge MTLCaptureManager*)m_ptr isCapturing];
    }
}
