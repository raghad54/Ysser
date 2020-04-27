//
//  Home.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/26/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation

class KsaState: Codable {
    let updated: Int
    let country: String
    let countryInfo: CountryInfo
    let cases, todayCases, deaths, todayDeaths: Int
    let recovered, active, critical, casesPerOneMillion: Int
    let deathsPerOneMillion, tests, testsPerOneMillion: Int
    let continent: String

    init(updated: Int, country: String, countryInfo: CountryInfo, cases: Int, todayCases: Int, deaths: Int, todayDeaths: Int, recovered: Int, active: Int, critical: Int, casesPerOneMillion: Int, deathsPerOneMillion: Int, tests: Int, testsPerOneMillion: Int, continent: String) {
        self.updated = updated
        self.country = country
        self.countryInfo = countryInfo
        self.cases = cases
        self.todayCases = todayCases
        self.deaths = deaths
        self.todayDeaths = todayDeaths
        self.recovered = recovered
        self.active = active
        self.critical = critical
        self.casesPerOneMillion = casesPerOneMillion
        self.deathsPerOneMillion = deathsPerOneMillion
        self.tests = tests
        self.testsPerOneMillion = testsPerOneMillion
        self.continent = continent
    }
}

// MARK: - CountryInfo
class CountryInfo: Codable {
    let id: Int
    let iso2, iso3: String
    let lat, long: Int
    let flag: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iso2, iso3, lat, long, flag
    }

    init(id: Int, iso2: String, iso3: String, lat: Int, long: Int, flag: String) {
        self.id = id
        self.iso2 = iso2
        self.iso3 = iso3
        self.lat = lat
        self.long = long
        self.flag = flag
    }
}
