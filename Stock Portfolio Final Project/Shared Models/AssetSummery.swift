//
//  AssetSummery.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 09/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

// MARK: - AssetSummery
struct AssetSummery: Codable {
    let majorDirectHolders: Holders
    let netSharePurchaseActivity: NetSharePurchaseActivity
    let financialData: FinancialData
    let summaryDetail: SummaryDetail
    let majorHoldersBreakdown: MajorHoldersBreakdown
    let institutionOwnership: Ownership
    let summaryProfile: SummaryProfile
    let insiderHolders: Holders
    let defaultKeyStatistics: DefaultKeyStatistics
    let quoteType: QuoteType
    let fundOwnership: Ownership
    let details: Details
    let symbol: String
    let pageViews: PageViews
    let earnings: AssetSummeryEarnings
    let esgScores: EsgScores
    let insiderTransactions: InsiderTransactions
    let calendarEvents: CalendarEvents
    let price: Price
    let recommendationTrend: RecommendationTrend
    let upgradeDowngradeHistory: UpgradeDowngradeHistory
    let financialsTemplate: FinancialsTemplate
}

// MARK: - CalendarEvents
struct CalendarEvents: Codable {
    let maxAge: Int
    let earnings: CalendarEventsEarnings
    let exDividendDate, dividendDate: DividendDate
}

// MARK: - DividendDate
struct DividendDate: Codable {
    let raw: Double
    let fmt: String
}

// MARK: - CalendarEventsEarnings
struct CalendarEventsEarnings: Codable {
    let revenueHigh: EnterpriseValue
    let earningsAverage: DividendDate
    let earningsDate: [DividendDate]
    let earningsHigh: DividendDate
    let revenueAverage, revenueLow: EnterpriseValue
    let earningsLow: DividendDate
}

// MARK: - EnterpriseValue
struct EnterpriseValue: Codable {
    let raw: Int
    let fmt: String?
    let longFmt: String
}

// MARK: - DefaultKeyStatistics
struct DefaultKeyStatistics: Codable {
    let earningsQuarterlyGrowth, forwardPE: DividendDate
    let lastCapGain: Details
    let sharesPercentSharesOut: DividendDate
    let yield: Details
    let sandP52WeekChange, lastDividendDate: DividendDate
    let lastSplitFactor: String
    let enterpriseToEbitda, pegRatio: DividendDate
    let sharesOutstanding: EnterpriseValue
    let forwardEps, priceToBook, shortRatio, beta: DividendDate
    let priceHint: EnterpriseValue
    let lastFiscalYearEnd: DividendDate
    let annualReportExpenseRatio, revenueQuarterlyGrowth, annualHoldingsTurnover, fundInceptionDate: Details
    let lastSplitDate: DividendDate
    let fundFamily, legalType: JSONNull?
    let morningStarRiskRating: Details
    let floatShares, sharesShort: EnterpriseValue
    let nextFiscalYearEnd: DividendDate
    let ytdReturn: Details
    let bookValue: DividendDate
    let beta3Year: Details
    let shortPercentOfFloat, dateShortInterest, enterpriseToRevenue: DividendDate
    let enterpriseValue: EnterpriseValue
    let fiveYearAverageReturn: Details
    let lastDividendValue: DividendDate
    let maxAge: Int
    let sharesShortPreviousMonthDate, trailingEps: DividendDate
    let priceToSalesTrailing12Months: Details
    let profitMargins: DividendDate
    let category: JSONNull?
    let impliedSharesOutstanding: Details
    let mostRecentQuarter: DividendDate
    let threeYearAverageReturn: Details
    let heldPercentInsiders, heldPercentInstitutions: DividendDate
    let morningStarOverallRating, totalAssets: Details
    let the52WeekChange: DividendDate
    let sharesShortPriorMonth, netIncomeToCommon: EnterpriseValue

    enum CodingKeys: String, CodingKey {
        case earningsQuarterlyGrowth, forwardPE, lastCapGain, sharesPercentSharesOut, yield
        case sandP52WeekChange = "SandP52WeekChange"
        case lastDividendDate, lastSplitFactor, enterpriseToEbitda, pegRatio, sharesOutstanding, forwardEps, priceToBook, shortRatio, beta, priceHint, lastFiscalYearEnd, annualReportExpenseRatio, revenueQuarterlyGrowth, annualHoldingsTurnover, fundInceptionDate, lastSplitDate, fundFamily, legalType, morningStarRiskRating, floatShares, sharesShort, nextFiscalYearEnd, ytdReturn, bookValue, beta3Year, shortPercentOfFloat, dateShortInterest, enterpriseToRevenue, enterpriseValue, fiveYearAverageReturn, lastDividendValue, maxAge, sharesShortPreviousMonthDate, trailingEps, priceToSalesTrailing12Months, profitMargins, category, impliedSharesOutstanding, mostRecentQuarter, threeYearAverageReturn, heldPercentInsiders, heldPercentInstitutions, morningStarOverallRating, totalAssets
        case the52WeekChange = "52WeekChange"
        case sharesShortPriorMonth, netIncomeToCommon
    }
}

// MARK: - Details
struct Details: Codable {
}

// MARK: - AssetSummeryEarnings
struct AssetSummeryEarnings: Codable {
    let maxAge: Int
    let financialsChart: FinancialsChart
    let earningsChart: EarningsChart
    let financialCurrency: String
}

// MARK: - EarningsChart
struct EarningsChart: Codable {
    let currentQuarterEstimateYear: Int
    let quarterly: [EarningsChartQuarterly]
    let earningsDate: [DividendDate]
    let currentQuarterEstimate: DividendDate
    let currentQuarterEstimateDate: String
}

// MARK: - EarningsChartQuarterly
struct EarningsChartQuarterly: Codable {
    let date: String
    let actual, estimate: DividendDate
}

// MARK: - FinancialsChart
struct FinancialsChart: Codable {
    let quarterly: [FinancialsChartQuarterly]
    let yearly: [Yearly]
}

// MARK: - FinancialsChartQuarterly
struct FinancialsChartQuarterly: Codable {
    let date: String
    let revenue, earnings: EnterpriseValue
}

// MARK: - Yearly
struct Yearly: Codable {
    let date: Int
    let revenue, earnings: EnterpriseValue
}

// MARK: - EsgScores
struct EsgScores: Codable {
    let gmo: Bool
    let percentile: DividendDate
    let highestControversy: Int
    let palmOil: Bool
    let peerSocialPerformance: PeerPerformance
    let environmentPercentile: JSONNull?
    let alcoholic, pesticides: Bool
    let governanceScore, environmentScore: DividendDate
    let peerGovernancePerformance: PeerPerformance
    let peerCount: Int
    let smallArms: Bool
    let relatedControversy: [String]
    let animalTesting: Bool
    let maxAge: Int
    let controversialWeapons, militaryContract: Bool
    let peerEsgScorePerformance: PeerPerformance
    let furLeather, coal: Bool
    let peerGroup: String
    let socialScore: DividendDate
    let socialPercentile: JSONNull?
    let totalEsg: DividendDate
    let peerEnvironmentPerformance: PeerPerformance
    let nuclear, gambling: Bool
    let ratingMonth: Int
    let catholic, tobacco, adult: Bool
    let ratingYear: Int
    let governancePercentile: JSONNull?
    let esgPerformance: String
    let peerHighestControversyPerformance: PeerPerformance
}

// MARK: - PeerPerformance
struct PeerPerformance: Codable {
    let min, avg, max: Double
}

// MARK: - FinancialData
struct FinancialData: Codable {
    let returnOnAssets: DividendDate
    let numberOfAnalystOpinions: EnterpriseValue
    let targetMedianPrice: DividendDate
    let totalRevenue: EnterpriseValue
    let grossMargins, targetLowPrice: DividendDate
    let maxAge: Int
    let currentRatio: DividendDate
    let operatingCashflow: EnterpriseValue
    let financialCurrency: String
    let ebitda: EnterpriseValue
    let returnOnEquity, targetMeanPrice, revenueGrowth: DividendDate
    let grossProfits: EnterpriseValue
    let revenuePerShare: DividendDate
    let freeCashflow: EnterpriseValue
    let quickRatio: DividendDate
    let totalCash, totalDebt: EnterpriseValue
    let profitMargins: DividendDate
    let recommendationKey: String
    let currentPrice, debtToEquity, operatingMargins, targetHighPrice: DividendDate
    let totalCashPerShare, ebitdaMargins, recommendationMean, earningsGrowth: DividendDate
}

// MARK: - FinancialsTemplate
struct FinancialsTemplate: Codable {
    let maxAge: Int
    let code: String
}

// MARK: - Ownership
struct Ownership: Codable {
    let maxAge: Int
    let ownershipList: [OwnershipList]
}

// MARK: - OwnershipList
struct OwnershipList: Codable {
    let maxAge: Int
    let organization: String
    let pctHeld: DividendDate
    let value: EnterpriseValue
    let reportDate: DividendDate
    let position: EnterpriseValue
}

// MARK: - Holders
struct Holders: Codable {
    let holders: [Holder]
    let maxAge: Int
}

// MARK: - Holder
struct Holder: Codable {
    let maxAge: Int
    let transactionDescription: TransactionDescription
    let positionDirectDate: DividendDate?
    let latestTransDate: DividendDate
    let positionDirect: EnterpriseValue?
    let relation: Relation
    let name, url: String
    let positionIndirect: EnterpriseValue?
    let positionIndirectDate: DividendDate?
}

enum Relation: String, Codable {
    case chiefExecutiveOfficer = "Chief Executive Officer"
    case chiefFinancialOfficer = "Chief Financial Officer"
    case chiefOperatingOfficer = "Chief Operating Officer"
    case director = "Director"
    case generalCounsel = "General Counsel"
    case officer = "Officer"
    case president = "President"
}

enum TransactionDescription: String, Codable {
    case conversionOfExerciseOfDerivativeSecurity = "Conversion of Exercise of derivative security"
    case sale = "Sale"
    case stockAwardGrant = "Stock Award(Grant)"
}

// MARK: - InsiderTransactions
struct InsiderTransactions: Codable {
    let maxAge: Int
    let transactions: [Transaction]
}

// MARK: - Transaction
struct Transaction: Codable {
    let shares: EnterpriseValue
    let moneyText: String
    let maxAge: Int
    let startDate: DividendDate
    let ownership: OwnershipEnum
    let filerURL, filerName, transactionText: String
    let value: EnterpriseValue?
    let filerRelation: Relation

    enum CodingKeys: String, CodingKey {
        case shares, moneyText, maxAge, startDate, ownership
        case filerURL = "filerUrl"
        case filerName, transactionText, value, filerRelation
    }
}

enum OwnershipEnum: String, Codable {
    case d = "D"
    case dI = "D/I"
    case i = "I"
}

// MARK: - MajorHoldersBreakdown
struct MajorHoldersBreakdown: Codable {
    let maxAge: Int
    let institutionsCount: EnterpriseValue
    let institutionsPercentHeld, insidersPercentHeld, institutionsFloatPercentHeld: DividendDate
}

// MARK: - NetSharePurchaseActivity
struct NetSharePurchaseActivity: Codable {
    let netInfoCount: EnterpriseValue
    let period: String
    let buyPercentInsiderShares: DividendDate
    let buyInfoShares, sellInfoShares: EnterpriseValue
    let maxAge: Int
    let netInfoShares, totalInsiderShares: EnterpriseValue
    let netPercentInsiderShares: DividendDate
    let sellInfoCount: EnterpriseValue
    let sellPercentInsiderShares: DividendDate
    let buyInfoCount: EnterpriseValue
}

// MARK: - PageViews
struct PageViews: Codable {
    let longTermTrend: String
    let maxAge: Int
    let midTermTrend, shortTermTrend: String
}

// MARK: - Price
struct Price: Codable {
    let symbol, currency: String
    let lastMarket: JSONNull?
    let volume24Hr: Details
    let preMarketSource: String
    let regularMarketPreviousClose, postMarketChange, regularMarketPrice: DividendDate
    let postMarketTime: Int
    let averageDailyVolume3Month: EnterpriseValue
    let circulatingSupply, openInterest: Details
    let exchangeDataDelayedBy: Int
    let currencySymbol: String
    let maxAge, regularMarketTime: Int
    let postMarketSource: String
    let strikePrice: Details
    let regularMarketDayLow: DividendDate
    let fromCurrency: JSONNull?
    let regularMarketVolume: EnterpriseValue
    let postMarketChangePercent, postMarketPrice: DividendDate
    let averageDailyVolume10Day: EnterpriseValue
    let regularMarketOpen: DividendDate
    let toCurrency: JSONNull?
    let exchange, marketState, longName: String
    let preMarketChange: Details
    let underlyingSymbol: JSONNull?
    let regularMarketChangePercent: DividendDate
    let quoteSourceName: String
    let regularMarketChange: DividendDate
    let exchangeName: String
    let preMarketPrice: Details
    let shortName, regularMarketSource: String
    let priceHint: EnterpriseValue
    let quoteType: String
    let marketCap: EnterpriseValue
    let volumeAllCurrencies: Details
    let regularMarketDayHigh: DividendDate
}

// MARK: - QuoteType
struct QuoteType: Codable {
    let symbol, quoteType, shortName, longName: String
    let exchange, exchangeTimezoneShortName, messageBoardID, market: String
    let exchangeTimezoneName: String
    let isEsgPopulated: Bool
    let gmtOffSetMilliseconds: String

    enum CodingKeys: String, CodingKey {
        case symbol, quoteType, shortName, longName, exchange, exchangeTimezoneShortName
        case messageBoardID = "messageBoardId"
        case market, exchangeTimezoneName, isEsgPopulated, gmtOffSetMilliseconds
    }
}

// MARK: - RecommendationTrend
struct RecommendationTrend: Codable {
    let trend: [Trend]
    let maxAge: Int
}

// MARK: - Trend
struct Trend: Codable {
    let strongSell, sell, strongBuy: Int
    let period: String
    let hold, buy: Int
}

// MARK: - SummaryDetail
struct SummaryDetail: Codable {
    let forwardPE, regularMarketDayHigh, dayHigh, dividendRate: DividendDate
    let dividendYield, regularMarketPreviousClose: DividendDate
    let yield: Details
    let fiftyTwoWeekLow, trailingPE, trailingAnnualDividendYield: DividendDate
    let askSize: EnterpriseValue
    let summaryDetailOpen: DividendDate
    let regularMarketVolume: EnterpriseValue
    let beta: DividendDate
    let currency: String
    let averageVolume: EnterpriseValue
    let dayLow: DividendDate
    let expireDate: Details
    let volume, priceHint: EnterpriseValue
    let twoHundredDayAverage, trailingAnnualDividendRate: DividendDate
    let openInterest: Details
    let bidSize: EnterpriseValue
    let fiftyTwoWeekHigh: DividendDate
    let ytdReturn: Details
    let fiftyDayAverage, regularMarketDayLow: DividendDate
    let marketCap: EnterpriseValue
    let fromCurrency: JSONNull?
    let exDividendDate, fiveYearAvgDividendYield: DividendDate
    let tradeable: Bool
    let maxAge: Int
    let ask, bid, regularMarketOpen: DividendDate
    let volumeAllCurrencies: Details
    let priceToSalesTrailing12Months: DividendDate
    let lastMarket: JSONNull?
    let startDate: Details
    let averageDailyVolume10Day: EnterpriseValue
    let volume24Hr: Details
    let averageVolume10Days: EnterpriseValue
    let strikePrice: Details
    let payoutRatio, previousClose: DividendDate
    let maxSupply, circulatingSupply, navPrice: Details
    let algorithm: JSONNull?
    let totalAssets: Details
    let toCurrency: JSONNull?

    enum CodingKeys: String, CodingKey {
        case forwardPE, regularMarketDayHigh, dayHigh, dividendRate, dividendYield, regularMarketPreviousClose, yield, fiftyTwoWeekLow, trailingPE, trailingAnnualDividendYield, askSize
        case summaryDetailOpen = "open"
        case regularMarketVolume, beta, currency, averageVolume, dayLow, expireDate, volume, priceHint, twoHundredDayAverage, trailingAnnualDividendRate, openInterest, bidSize, fiftyTwoWeekHigh, ytdReturn, fiftyDayAverage, regularMarketDayLow, marketCap, fromCurrency, exDividendDate, fiveYearAvgDividendYield, tradeable, maxAge, ask, bid, regularMarketOpen, volumeAllCurrencies, priceToSalesTrailing12Months, lastMarket, startDate, averageDailyVolume10Day, volume24Hr
        case averageVolume10Days = "averageVolume10days"
        case strikePrice, payoutRatio, previousClose, maxSupply, circulatingSupply, navPrice, algorithm, totalAssets, toCurrency
    }
}

// MARK: - SummaryProfile
struct SummaryProfile: Codable {
    let state, industry, zip, phone: String
    let address1, longBusinessSummary: String
    let maxAge: Int
    let city: String
    let fullTimeEmployees: Int
    let companyOfficers: [JSONAny]
    let sector, country: String
    let website: String
}

// MARK: - UpgradeDowngradeHistory
struct UpgradeDowngradeHistory: Codable {
    let history: [History]
    let maxAge: Int
}

// MARK: - History
struct History: Codable {
    let fromGrade: Grade
    let action: Action
    let epochGradeDate: Int
    let toGrade: Grade
    let firm: String
}

enum Action: String, Codable {
    case actionInit = "init"
    case down = "down"
    case main = "main"
    case reit = "reit"
    case up = "up"
}

enum Grade: String, Codable {
    case accumulate = "Accumulate"
    case buy = "Buy"
    case empty = ""
    case equalWeight = "Equal-Weight"
    case gradeEqualWeight = "Equal-weight"
    case gradeLongTermBuy = "Long-term Buy"
    case hold = "Hold"
    case longTermBuy = "Long-Term Buy"
    case marketOutperform = "Market Outperform"
    case marketPerform = "Market Perform"
    case negative = "Negative"
    case neutral = "Neutral"
    case outperform = "Outperform"
    case overweight = "Overweight"
    case perform = "Perform"
    case positive = "Positive"
    case reduce = "Reduce"
    case sectorOutperform = "Sector Outperform"
    case sectorPerform = "Sector Perform"
    case sectorWeight = "Sector Weight"
    case sell = "Sell"
    case strongBuy = "Strong Buy"
    case underperform = "Underperform"
    case underweight = "Underweight"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
