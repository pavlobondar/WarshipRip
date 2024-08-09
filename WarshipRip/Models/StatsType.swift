//
//  Stats.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation

enum StatsType: String, CaseIterable, Identifiable {
    case personnelUnits
    case tanks
    case armouredFightingVehicles
    case artillerySystems
    case mlrs
    case aaWarfareSystems
    case planes
    case helicopters
    case vehiclesFuelTanks
    case warshipsCutters
    case cruiseMissiles
    case uavSystems
    case specialMilitaryEquip
    case atgmSrbmSystems
    case submarines
    
    var id: String {
        return rawValue
    }
    
    var title: String {
        switch self {
        case .personnelUnits:
            return "особового складу"
        case .tanks:
            return "танків"
        case .armouredFightingVehicles:
            return "ББМ"
        case .artillerySystems:
            return "арт. систем"
        case .mlrs:
            return "РСЗВ"
        case .aaWarfareSystems:
            return "засобів ППО"
        case .planes:
            return "літаків"
        case .helicopters:
            return "гелікоптерів"
        case .vehiclesFuelTanks:
            return "автотехніки та автоцистерн"
        case .warshipsCutters:
            return "кораблів та катерів"
        case .cruiseMissiles:
            return "крилатих ракет"
        case .uavSystems:
            return "БПЛА"
        case .specialMilitaryEquip:
            return "спец. техніки"
        case .atgmSrbmSystems:
            return "ПКЗ та СБРМД"
        case .submarines:
            return "підводних човнів"
        }
    }
    
    var image: String {
        switch self {
        case .personnelUnits:
            return "/icon-people.svg"
        case .tanks:
            return "/icon-tank.svg"
        case .armouredFightingVehicles:
            return "/icon-bbm.svg"
        case .artillerySystems:
            return "/icon-art.svg"
        case .mlrs:
            return "/icon-rszv.svg"
        case .aaWarfareSystems:
            return "/icon-ppo.svg"
        case .planes:
            return "/icon-plane.svg"
        case .helicopters:
            return "/icon-helicopter.svg"
        case .vehiclesFuelTanks:
            return "/icon-auto.svg"
        case .warshipsCutters:
            return "/icon-ship.svg"
        case .cruiseMissiles:
            return "/icon-rocket.svg"
        case .uavSystems:
            return "/icon-bpla.svg"
        case .specialMilitaryEquip:
            return "/icon-special.svg"
        case .atgmSrbmSystems:
            return "/icon-trk.svg"
        case .submarines:
            return "/icon-submarine.svg"
        }
    }
}
