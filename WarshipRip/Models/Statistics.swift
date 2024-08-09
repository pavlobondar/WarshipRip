//
//  Statistics.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation

struct Statistics: Decodable {
    let personnelUnits: Int
    let tanks: Int
    let armouredFightingVehicles: Int
    let artillerySystems: Int
    let mlrs: Int
    let aaWarfareSystems: Int
    let planes: Int
    let helicopters: Int
    let vehiclesFuelTanks: Int
    let warshipsCutters: Int
    let cruiseMissiles: Int
    let uavSystems: Int
    let specialMilitaryEquip: Int
    let atgmSrbmSystems: Int
    let submarines: Int
    
    enum CodingKeys: String, CodingKey {
        case personnelUnits = "personnel_units"
        case tanks = "tanks"
        case armouredFightingVehicles = "armoured_fighting_vehicles"
        case artillerySystems = "artillery_systems"
        case mlrs = "mlrs"
        case aaWarfareSystems = "aa_warfare_systems"
        case planes = "planes"
        case helicopters = "helicopters"
        case vehiclesFuelTanks = "vehicles_fuel_tanks"
        case warshipsCutters = "warships_cutters"
        case cruiseMissiles = "cruise_missiles"
        case uavSystems = "uav_systems"
        case specialMilitaryEquip = "special_military_equip"
        case atgmSrbmSystems = "atgm_srbm_systems"
        case submarines = "submarines"
    }
    
    func getValue(for type: StatsType) -> Int {
        switch type {
        case .personnelUnits:
            return personnelUnits
        case .tanks:
            return tanks
        case .armouredFightingVehicles:
            return armouredFightingVehicles
        case .artillerySystems:
            return artillerySystems
        case .mlrs:
            return mlrs
        case .aaWarfareSystems:
            return aaWarfareSystems
        case .planes:
            return planes
        case .helicopters:
            return helicopters
        case .vehiclesFuelTanks:
            return vehiclesFuelTanks
        case .warshipsCutters:
            return warshipsCutters
        case .cruiseMissiles:
            return cruiseMissiles
        case .uavSystems:
            return uavSystems
        case .specialMilitaryEquip:
            return specialMilitaryEquip
        case .atgmSrbmSystems:
            return atgmSrbmSystems
        case .submarines:
            return submarines
        }
    }
}
