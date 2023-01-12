//
//  CustomError.swift
//  CSAPIServer
//
//  Created by Yusuke Miyanaga on 2022/12/30.
//

import Foundation

public enum CovidError: Error {
    case incorrectURL, noDataReceived, responseError
}
