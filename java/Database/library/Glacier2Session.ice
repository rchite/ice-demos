// **********************************************************************
//
// Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#pragma once

#include <Glacier2/Session.ice>
#include <Library.ice>

module Demo
{

/**
 *
 * The session object. This is used to retrieve a per-session library
 * on behalf of the client. If the session is not refreshed on a
 * periodic basis, it will be automatically destroyed.
 *
 */
interface Glacier2Session extends Glacier2::Session
{
    /**
     *
     * Get the library object.
     *
     * @return A proxy for the new library.
     *
     **/
    Library* getLibrary();
};

};
