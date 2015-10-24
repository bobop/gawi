class LoadDataIntoTwitterAccounts < ActiveRecord::Migration
  def up
    # A
    TwitterAccount.create(twitter_handle: "GMPCityCentre", admin_ward_id: "A1")
    TwitterAccount.create(twitter_handle: "GMPCheetham", admin_ward_id: "A2")
    TwitterAccount.create(twitter_handle: "GMPBradford", admin_ward_id: "A3")
    # E
    TwitterAccount.create(twitter_handle: "GMPLongsight", admin_ward_id: "E1")
    TwitterAccount.create(twitter_handle: "GMPFallowfield", admin_ward_id: "E2")
    TwitterAccount.create(twitter_handle: "GMPDidsbury", admin_ward_id: "E3")
    TwitterAccount.create(twitter_handle: "GMPWythenshawe", admin_ward_id: "E4")
    # F
    TwitterAccount.create(twitter_handle: "GMPSalfordWest", admin_ward_id: "F1")
    TwitterAccount.create(twitter_handle: "GMPSalfordEast", admin_ward_id: "F2")
    # G
    TwitterAccount.create(twitter_handle: "GMPAshton", admin_ward_id: "G1")
    TwitterAccount.create(twitter_handle: "GMPHyde", admin_ward_id: "G2")
    # I
    TwitterAccount.create(twitter_handle: "GMPMcrAirport", admin_ward_id: "I1")
    # J
    TwitterAccount.create(twitter_handle: "GMPStockNorth", admin_ward_id: "J1")
    TwitterAccount.create(twitter_handle: "GMPStockEast", admin_ward_id: "J2")
    TwitterAccount.create(twitter_handle: "GMPStockWest", admin_ward_id: "J3")
    # K
    TwitterAccount.create(twitter_handle: "GMPBoltonCentre", admin_ward_id: "K1")
    TwitterAccount.create(twitter_handle: "GMPBoltonNorth", admin_ward_id: "K2")
    TwitterAccount.create(twitter_handle: "GMPBoltonSouth", admin_ward_id: "K3")
    # L
    TwitterAccount.create(twitter_handle: "GMPWigan", admin_ward_id: "L1")
    TwitterAccount.create(twitter_handle: "GMPWigan", admin_ward_id: "L2")
    # M
    TwitterAccount.create(twitter_handle: "GMPStretford", admin_ward_id: "M1")
    TwitterAccount.create(twitter_handle: "GMPAltrincham", admin_ward_id: "M2")
    # N
    TwitterAccount.create(twitter_handle: "GMPBuryNorth", admin_ward_id: "N1")
    TwitterAccount.create(twitter_handle: "GMPRadcliffe", admin_ward_id: "N2")
    # P
    TwitterAccount.create(twitter_handle: "GMPRochdaleNrth", admin_ward_id: "P1")
    TwitterAccount.create(twitter_handle: "GMPRochdaleEast", admin_ward_id: "P2")
    TwitterAccount.create(twitter_handle: "GMPMiddleton", admin_ward_id: "P3")
    # Q
    TwitterAccount.create(twitter_handle: "GMPChadderton", admin_ward_id: "Q1")
    TwitterAccount.create(twitter_handle: "GMPRoytonShaw", admin_ward_id: "Q2")
  end
end
