//
//  Kroman.swift
//  Kroman
//
//  Created by Kai Yu on 9/13/15.
//  Copyright © 2015 Zhang Kai Yu. All rights reserved.
//

class Kroman {

    static let headJamos = ["g", "gg", "n", "d", "dd", "r", "m",
    "b", "bb", "s", "ss", "", "j", "jj",
    "c", "k", "t", "p", "h"];

    static let bodyJamos = ["a", "ae", "ya", "yae", "eo", "e", "yeo",
    "ye", "o", "wa", "wae", "oe", "yo", "u",
    "weo", "we", "wi", "yu", "eu", "eui", "i"];

    static let tailJamos = ["", "g", "gg", "gs", "n", "nj", "nh", "d",
    "r", "rk", "rm", "rb", "rs", "rt", "rp", "rh",
    "m", "b", "bs", "s", "ss", "ng", "j", "c",
    "k", "t", "p", "h"];

    static let headInterval = 588;

    static let bodyInterval = 28;

    static let ga = UnicodeScalar(0xac00);

    static let hih = UnicodeScalar(0xd7a3);

    class func parse(content: String) -> String {
        var retval = ""
        var lastCharIsHangul = false
        let scalars = content.unicodeScalars
        for (var index = scalars.startIndex;
            index < scalars.endIndex;
            index = index.advancedBy(1)) {
                let char = scalars[index]
                if ((ga <= char) && (char <= hih)) {
                    let head = (Int(char.value) - Int(ga.value)) / headInterval
                    let headl = (Int(char.value) - Int(ga.value)) % headInterval
                    let body = headl / bodyInterval
                    let tail = headl % bodyInterval
                    if (lastCharIsHangul) {
                        retval.append(Character("-"))
                    }
                    let roman = "\(headJamos[head])\(bodyJamos[body])\(tailJamos[tail])"
                    retval.appendContentsOf(roman)
                    lastCharIsHangul = true
                } else {
                    lastCharIsHangul = false
                    retval.append(char)
                }
        }
        return retval;
    }
}
