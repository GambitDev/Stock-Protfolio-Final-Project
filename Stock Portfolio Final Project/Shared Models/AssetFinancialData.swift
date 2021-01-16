//
//  AssetFinancialData.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 05/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

// MARK: - AssetFinancialDetails
struct AssetFinancialDetails: Codable {
    let summaryDetail: SummaryDetail
    let pageViews: PageViews
    let timeSeries: TimeSeries
    let loading: Bool
    let cashflowStatementHistoryQuarterly: CashflowStatementHistory
    let financialsTemplate: FinancialsTemplate
    let symbol: String
    let balanceSheetHistoryQuarterly: BalanceSheetHistory
    let cashflowStatementHistory: CashflowStatementHistory
    let price: Price
    let incomeStatementHistoryQuarterly: IncomeStatementHistory
    let quoteType: QuoteType
    let meta: Meta
    let errorList: [JSONAny]
    let incomeStatementHistory: IncomeStatementHistory
    let earnings: Earnings
    let balanceSheetHistory: BalanceSheetHistory
}

// MARK: - BalanceSheetHistory
struct BalanceSheetHistory: Codable {
    let maxAge: Int
    let balanceSheetStatements: [BalanceSheetStatement]
}

// MARK: - BalanceSheetStatement
struct BalanceSheetStatement: Codable {
    let totalAssets, totalCurrentAssets, otherCurrentLiab, treasuryStock: AverageDailyVolume10Day
    let retainedEarnings, totalStockholderEquity: AverageDailyVolume10Day
    let maxAge: Int
    let inventory, cash, netTangibleAssets: AverageDailyVolume10Day
    let endDate: PostMarketChange
    let otherAssets, totalLiab, longTermDebt, totalCurrentLiabilities: AverageDailyVolume10Day
    let propertyPlantEquipment, shortLongTermDebt, shortTermInvestments, otherLiab: AverageDailyVolume10Day
    let netReceivables, accountsPayable, commonStock, otherCurrentAssets: AverageDailyVolume10Day
    let otherStockholderEquity, longTermInvestments: AverageDailyVolume10Day
}

// MARK: - AverageDailyVolume10Day
struct AverageDailyVolume10Day: Codable {
    let raw: Int
    let fmt, longFmt: String
}

// MARK: - PostMarketChange
struct PostMarketChange: Codable {
    let raw: Double
    let fmt: String
}

// MARK: - CashflowStatementHistory
struct CashflowStatementHistory: Codable {
    let maxAge: Int
    let cashflowStatements: [CashflowStatement]
}

// MARK: - CashflowStatement
struct CashflowStatement: Codable {
    let otherCashflowsFromFinancingActivities, issuanceOfStock, otherCashflowsFromInvestingActivities, changeToInventory: AverageDailyVolume10Day
    let netBorrowings, changeToNetincome: AverageDailyVolume10Day
    let maxAge: Int
    let totalCashflowsFromInvestingActivities, totalCashFromOperatingActivities, changeToLiabilities, changeInCash: AverageDailyVolume10Day
    let capitalExpenditures, repurchaseOfStock: AverageDailyVolume10Day
    let endDate: PostMarketChange
    let investments, depreciation, changeToOperatingActivities, dividendsPaid: AverageDailyVolume10Day
    let changeToAccountReceivables, netIncome, totalCashFromFinancingActivities: AverageDailyVolume10Day
}

// MARK: - Earnings
struct Earnings: Codable {
    let maxAge: Int
    let financialsChart: FinancialsChart
    let earningsChart: EarningsChart
    let financialCurrency: FinancialCurrency
}

// MARK: - EarningsChart
struct EarningsChart: Codable {
    let currentQuarterEstimateYear: Int
    let quarterly: [EarningsChartQuarterly]
    let earningsDate: [PostMarketChange]
    let currentQuarterEstimate: PostMarketChange
    let currentQuarterEstimateDate: String
}

// MARK: - EarningsChartQuarterly
struct EarningsChartQuarterly: Codable {
    let date: String
    let actual, estimate: PostMarketChange
}

enum FinancialCurrency: String, Codable {
    case usd = "USD"
}

// MARK: - FinancialsChart
struct FinancialsChart: Codable {
    let quarterly: [FinancialsChartQuarterly]
    let yearly: [Yearly]
}

// MARK: - FinancialsChartQuarterly
struct FinancialsChartQuarterly: Codable {
    let date: String
    let revenue, earnings: AverageDailyVolume10Day
}

// MARK: - Yearly
struct Yearly: Codable {
    let date: Int
    let revenue, earnings: AverageDailyVolume10Day
}

// MARK: - FinancialsTemplate
struct FinancialsTemplate: Codable {
    let maxAge: Int
    let code: String
}

// MARK: - IncomeStatementHistory
struct IncomeStatementHistory: Codable {
    let incomeStatementHistory: [IncomeStatementHistoryElement]
    let maxAge: Int
}

// MARK: - IncomeStatementHistoryElement
struct IncomeStatementHistoryElement: Codable {
    let researchDevelopment, totalRevenue, costOfRevenue: AverageDailyVolume10Day
    let otherItems: CirculatingSupply
    let incomeTaxExpense, netIncomeFromContinuingOps, totalOtherIncomeExpenseNet, grossProfit: AverageDailyVolume10Day
    let maxAge: Int
    let totalOperatingExpenses, netIncomeApplicableToCommonShares, incomeBeforeTax, interestExpense: AverageDailyVolume10Day
    let operatingIncome: AverageDailyVolume10Day
    let endDate: PostMarketChange
    let discontinuedOperations, effectOfAccountingCharges, minorityInterest: CirculatingSupply
    let ebit, sellingGeneralAdministrative: AverageDailyVolume10Day
    let otherOperatingExpenses, extraordinaryItems: CirculatingSupply
    let netIncome: AverageDailyVolume10Day
    let nonRecurring: CirculatingSupply
}

// MARK: - CirculatingSupply
struct CirculatingSupply: Codable {
}

// MARK: - Meta
struct Meta: Codable {
    let symbol: String
    let end: Int
    let timeUnit: String
    let start: Int
}

// MARK: - PageViews
struct PageViews: Codable {
    let longTermTrend: String
    let maxAge: Int
    let midTermTrend, shortTermTrend: String
}

// MARK: - Price
struct Price: Codable {
    let symbol: String
    let currency: FinancialCurrency
    let lastMarket: JSONNull?
    let volume24Hr: CirculatingSupply
    let preMarketSource: String
    let regularMarketPreviousClose, postMarketChange, regularMarketPrice: PostMarketChange
    let postMarketTime: Int
    let averageDailyVolume3Month: AverageDailyVolume10Day
    let circulatingSupply: CirculatingSupply
    let preMarketTime, exchangeDataDelayedBy: Int
    let currencySymbol: String
    let openInterest: CirculatingSupply
    let maxAge, regularMarketTime: Int
    let postMarketSource: String
    let strikePrice: CirculatingSupply
    let preMarketChangePercent, regularMarketDayLow: PostMarketChange
    let fromCurrency: JSONNull?
    let regularMarketVolume: AverageDailyVolume10Day
    let postMarketChangePercent, postMarketPrice: PostMarketChange
    let averageDailyVolume10Day: AverageDailyVolume10Day
    let regularMarketOpen: PostMarketChange
    let toCurrency: JSONNull?
    let exchange, marketState, longName: String
    let preMarketChange: PostMarketChange
    let underlyingSymbol: JSONNull?
    let regularMarketChangePercent: PostMarketChange
    let quoteSourceName: String
    let regularMarketChange: PostMarketChange
    let exchangeName: String
    let preMarketPrice: PostMarketChange
    let shortName, regularMarketSource: String
    let priceHint: AverageDailyVolume10Day
    let quoteType: String
    let marketCap: AverageDailyVolume10Day
    let volumeAllCurrencies: CirculatingSupply
    let regularMarketDayHigh: PostMarketChange
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

// MARK: - SummaryDetail
struct SummaryDetail: Codable {
    let forwardPE, regularMarketDayHigh, dayHigh, dividendRate: PostMarketChange
    let dividendYield, regularMarketPreviousClose: PostMarketChange
    let yield: CirculatingSupply
    let fiftyTwoWeekLow, trailingPE, trailingAnnualDividendYield: PostMarketChange
    let askSize: AverageDailyVolume10Day
    let summaryDetailOpen: PostMarketChange
    let regularMarketVolume: AverageDailyVolume10Day
    let beta: PostMarketChange
    let currency: FinancialCurrency
    let averageVolume: AverageDailyVolume10Day
    let dayLow: PostMarketChange
    let expireDate: CirculatingSupply
    let volume, priceHint: AverageDailyVolume10Day
    let twoHundredDayAverage, trailingAnnualDividendRate: PostMarketChange
    let openInterest: CirculatingSupply
    let bidSize: AverageDailyVolume10Day
    let fiftyTwoWeekHigh: PostMarketChange
    let ytdReturn: CirculatingSupply
    let fiftyDayAverage, regularMarketDayLow: PostMarketChange
    let marketCap: AverageDailyVolume10Day
    let fromCurrency: JSONNull?
    let exDividendDate, fiveYearAvgDividendYield: PostMarketChange
    let tradeable: Bool
    let maxAge: Int
    let ask, bid, regularMarketOpen: PostMarketChange
    let volumeAllCurrencies: CirculatingSupply
    let priceToSalesTrailing12Months: PostMarketChange
    let lastMarket: JSONNull?
    let startDate: CirculatingSupply
    let averageDailyVolume10Day: AverageDailyVolume10Day
    let volume24Hr: CirculatingSupply
    let averageVolume10Days: AverageDailyVolume10Day
    let strikePrice: CirculatingSupply
    let payoutRatio, previousClose: PostMarketChange
    let maxSupply, circulatingSupply, navPrice: CirculatingSupply
    let algorithm: JSONNull?
    let totalAssets: CirculatingSupply
    let toCurrency: JSONNull?

    enum CodingKeys: String, CodingKey {
        case forwardPE, regularMarketDayHigh, dayHigh, dividendRate, dividendYield, regularMarketPreviousClose, yield, fiftyTwoWeekLow, trailingPE, trailingAnnualDividendYield, askSize
        case summaryDetailOpen = "open"
        case regularMarketVolume, beta, currency, averageVolume, dayLow, expireDate, volume, priceHint, twoHundredDayAverage, trailingAnnualDividendRate, openInterest, bidSize, fiftyTwoWeekHigh, ytdReturn, fiftyDayAverage, regularMarketDayLow, marketCap, fromCurrency, exDividendDate, fiveYearAvgDividendYield, tradeable, maxAge, ask, bid, regularMarketOpen, volumeAllCurrencies, priceToSalesTrailing12Months, lastMarket, startDate, averageDailyVolume10Day, volume24Hr
        case averageVolume10Days = "averageVolume10days"
        case strikePrice, payoutRatio, previousClose, maxSupply, circulatingSupply, navPrice, algorithm, totalAssets, toCurrency
    }
}

// MARK: - TimeSeries
struct TimeSeries: Codable {
    let trailingGrossProfit: [AnnualCostOfRevenue]
    let timestamp: [Int]
    let annualInterestExpense, annualTotalRevenue, trailingTotalRevenue, annualResearchAndDevelopment: [AnnualCostOfRevenue]
    let trailingDilutedEPS: [JSONAny]
    let trailingOtherIncomeExpense, annualNetIncomeCommonStockholders, annualGrossProfit, annualOtherIncomeExpense: [AnnualCostOfRevenue]
    let annualNetIncome, annualPretaxIncome: [AnnualCostOfRevenue]
    let annualDilutedEPS: [AnnualCostOfRevenue?]
    let trailingBasicEPS: [JSONAny]
    let trailingInterestExpense, annualSellingGeneralAndAdministration, annualCostOfRevenue, annualOperatingIncome: [AnnualCostOfRevenue]
    let trailingCostOfRevenue, annualEbitda, annualNetIncomeContinuousOperations, trailingResearchAndDevelopment: [AnnualCostOfRevenue]
    let trailingOperatingIncome, trailingSellingGeneralAndAdministration, trailingTaxProvision, annualOperatingExpense: [AnnualCostOfRevenue]
    let trailingOperatingExpense: [AnnualCostOfRevenue]
    let trailingDilutedAverageShares: [JSONAny]
    let annualDilutedAverageShares: [AnnualCostOfRevenue?]
    let trailingNetIncomeCommonStockholders, annualTaxProvision, trailingPretaxIncome: [AnnualCostOfRevenue]
    let annualBasicAverageShares, annualBasicEPS: [AnnualCostOfRevenue?]
    let trailingNetIncomeContinuousOperations: [AnnualCostOfRevenue]
    let trailingBasicAverageShares: [JSONAny]
    let trailingNetIncome: [AnnualCostOfRevenue]
}

// MARK: - AnnualCostOfRevenue
struct AnnualCostOfRevenue: Codable {
    let dataID: Int
    let periodType: PeriodType
    let currencyCode: FinancialCurrency
    let reportedValue: PostMarketChange
    let asOfDate: String

    enum CodingKeys: String, CodingKey {
        case dataID = "dataId"
        case periodType, currencyCode, reportedValue, asOfDate
    }
}

enum PeriodType: String, Codable {
    case the12M = "12M"
    case ttm = "TTM"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
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
