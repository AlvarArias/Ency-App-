//
//  DataModel.swift
//  testing API Zoho
//
//  Created by Alvar Arias on 2022-10-11.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
//import OAuth2

var autCode: String = ""


struct responseZoho: Codable {
    let access_token: String
    let api_domain: String
    let token_type: String
    let expires_in: Int

    enum CodingKeys: String, CodingKey {
        case access_token = "access_token"
        case api_domain = "api_domain"
        case token_type = "token_type"
        case expires_in = "expires_in"
    }
}


// Create Model


import Foundation

// MARK: - Welcome1
struct SaveEstimate {
    let customer_id: Int
    let contact_persons: [String]
    let template_id, estimate_number, reference_number, date: String
    let expiry_date: String
    let discount: Int
    let is_discount_before_tax: Bool
    let discount_type, custom_body, custom_subject, salesperson_name: String
    let custom_fields: [CustomField]
    let line_items: [LineItem]
    let notes, terms: String
    let shipping_charge, adjustment: Int
    let adjustment_description, tax_id, item_id: String
    let line_item_id: Int
    let name, description: String
    let rate: Int
    let unit: String
    let quantity, project_id: Int
    
    enum CodingKeys: String, CodingKey {
          case customer_id = "customer_id"
          case contact_persons = "contact_persons"
          case template_id = "template_id"
          case estimate_number = "estimate_number"
          case reference_number = "reference_number"
          case date = "date"
          case expiry_date = "expiry_date"
          case discount = "discount"
          case is_iscount_before_tax = "is_discount_before_tax"
          case discount_type = "discount_type"
          case custom_body = "custom_body"
          case custom_subject = "custom_subject"
          case salesperson_name = "salesperson_name"
            case notes = "notes"
            case terms = "terms"
            case shipping_charge = "shipping_charge"
            case adjustment = "adjustment"
            case adjustment_description = "adjustment_description"
            case tax_id = "tax_id"
            case item_id = "item_id"
            case line_item_id = "line_item_id"
            case name = "name"
            case welcome_description = "description"
            case rate = "rate"
            case unit = "unit"
            case quantity = "quantity"
            case project_id = "project_id"
        
    }
}

// MARK: - CustomField
struct CustomField {
    let index: Int
    let value: String
    
    enum CodingKeys: String, CodingKey {
            case index = "index"
            case value = "value"
    }
}

// MARK: - LineItem
struct LineItem {
    let item_id: String
    let line_item_id: Int
    let name, line_item_description, product_type: String
    let item_order, bcy_rate, rate: Int
    let quantity: Int
    let unit: String
    let discount_amount, discount: Int
    let tax_id, tax_name, tax_type: String
    let tax_percentage: Double
    let tax_treatment_code: String
    let item_total: Int
    
    enum CodingKeys: String, CodingKey {
            case item_id = "item_id"
            case line_item_id = "line_item_id"
            case name = "name"
            case welcome_description = "description"
            case product_type = "product_type"
            case item_order = "item_order"
            case bcy_rate = "bcy_rate"
            case rate = "rate"
            case quantity = "quantity"
            case unit = "unit"
            case discount_amount = "discount_amount"
            case discount = "discount"
            case tax_id = "tax_id"
            case tax_name = "tax_name"
            case tax_type = "tax_type"
            case tax_percentage = "tax_percentage"
            case tax_treatment_code = "tax_treatment_code"
            case item_total = "item_total"
        }
    
}



