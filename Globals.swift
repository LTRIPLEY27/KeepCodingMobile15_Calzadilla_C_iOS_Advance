//
//  Globals.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation

var tokenLog : String = ""
var apiClient : ApiClient?

func isAUserOk() -> Bool {
    return !tokenLog.isEmpty
}
