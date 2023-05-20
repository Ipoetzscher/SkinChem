//
//  Data.swift
//  TestApp
//
//  Created by India Poetzscher on 4/5/22.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var title: String
    var shortened: String
    var previewText: String
    var isDisease: Bool
    var capitalize: Bool
    var plural: String
    var chemicalsAnswer1: String
    var diseasesAnswer1: String
    var diseasesAnswer2: String
    var image: String?
    var image2: String?
    var chemicalsQuestion1: String? {
        if !isDisease && capitalize {
            return ("Why \(plural) \(shortened) bad for your skin?")
        } else if !isDisease && !capitalize {
            return ("Why \(plural) \(shortened.lowercased()) bad for your skin?")
        } else {
            return nil
        }
    }
    var diseasesQuestion1: String? {
        if isDisease && capitalize {
            return ("What causes \(shortened) and how can I prevent it?")
        } else if isDisease && !capitalize {
            return ("What causes \(shortened.lowercased()) and how can I prevent it?")
        } else {
            return nil
        }
    }
    var diseasesQuestion2: String? {
        if isDisease && capitalize {
            return ("How do you treat \(shortened)?")
        } else if isDisease && !capitalize {
            return ("How do you treat \(shortened.lowercased())?")
        } else {
            return nil
        }
    }

    static let sample: Item = Item(title: "test", shortened: "test", previewText: "test", isDisease: true, capitalize: true, plural: "are", chemicalsAnswer1: "test", diseasesAnswer1: "test", diseasesAnswer2: "test", image: "sun")
}


var items = [Item(title: "Polycyclic Aromatic Hydrocarbons (PAHs)", shortened: "PAHs", previewText: "Polycyclic Aromatic Hydrocarbons (PAHs) are one of the most abundant organic pollutants and are produced as a result of combustion reactions, including wood burning, exhaust fumes, smoking, and waste incineration.", isDisease: false, capitalize: true, plural: "are", chemicalsAnswer1: "Through transepidermal absorption, PAHs can interfere with the regular function of our skin cells (1) and cause damage to the skin ranging from minor skin irritation to possible skin cancer. (3) PAHs are first converted into quinines, chemicals that produce reactive oxygen species (1) Once absorbed into the skin, PAHs produce exposides and diols which can bind to DNA and cause skin cancer. (5) Among the PAHs, 1,2-Benzanthracene and benzo[a]pyrene were the most disruptive of the skin’s barrier, (2) especially alongside UVA exposure. (5)  2, 3, 7, 8-tetrachlorodibenzo-p-dioxin (TCDD), a common PAH, has been known to lead to eruptions that resemble acne, including halogen acne. (5) ", diseasesAnswer1: "", diseasesAnswer2: "test", image: "pahs", image2: "vocs"),
             
             Item(title: "Volatile Organic Comounds (VOCs)", shortened: "VOCs", previewText: "VOCs are emitted from various organic solvents in paints, varnishes, tobacco smoke, car exhaust, and industrial facilities.", isDisease: false, capitalize: true, plural: "are", chemicalsAnswer1: "When combined with exposure to sunlight and nitrogen oxides, volatile organic compounds can form photochemical oxidant products including ozone. Exposure to VOCs increases cytokines, substances released by various cells, and can cause the development of inflammatory allergic reactions such as atopic dermatitis and eczema. (1) A study showed that an increase in exposure to VOCs caused the increase in symptoms of atopic dermatitis. (6)", diseasesAnswer1: "", diseasesAnswer2: "test", image: "vocs"),
             
             Item(title: "Oxides", shortened: "Oxides", previewText: "Oxides are any chemical compound with at least one oxygen atom bonded to another element. Examples are nitrogen dioxide (NO2) and sulfur dioxide (SO2).", isDisease: false, capitalize: false, plural: "are", chemicalsAnswer1: "Nitrogen oxides in the air react with ozone to form nitrogen dioxide which is responsible for “oxidative damage.” Oxidative damage is the damage to skin cells and tissue due to an imbalance of the body’s natural antioxidants and environmentally accumulated free radicals (including NO2). When the body is unable to remove these free radicals, including nitrogen dioxide, it manifests on the surface level as skin-aging and various diseases. (1). Similarly, carbon monoxide, a product of incomplete combustion, binds to heme molecules and alters its function, which can have various effects on the skin. (5) A study in Taiwan found that exposure to oxides like nitrogen oxides and carbon monoxide through traffic pollution was associated with the development of eczema in children. (1)", diseasesAnswer1: "", diseasesAnswer2: "test", image: "oxides"),
             
             Item(title: "Cigarette Smoke", shortened: "Cigarette Smoke", previewText: "Cigarette smoke is composed of thousands of damaging chemicals which interact with the skin, including reactive oxygen species (ROS), reactive nitrogen products, and the toxic catechol.", isDisease: false, capitalize: false, plural: "is", chemicalsAnswer1: "Among the thousands of chemicals in cigarette smoke, many can cause transepidermal water loss, degeneration of connective tissue, and an increase in production of certain enzymes. ROSs can cause oxidative stress on the skin by disrupting the balance between oxidants and the body’s natural antioxidants. Psoriasis, squamous cell carcinoma (a type of skin cancer), keratoacanthoma, and acne vulgaris are also associated with smoking cigarettes (1). “Smoker’s face” is characterized by wrinkling, skin discoloration, and other signs of premature aging. Those who smoke cigarettes are 4.7 times more likely to develop facial wrinkles (1).", diseasesAnswer1: "", diseasesAnswer2: "test", image: "hydrogen cyanide", image2: "nicotine"),
             
             Item(title: "Ultra Violet Radiation (UVR)", shortened: "UVR", previewText: "Ultraviolet radiation (UVR) is a form of electromagnetic radiation naturally produced by the sun. The three types of UVR are UVA, UVB, and UVC, all with different wavelengths.", isDisease: false, capitalize: true, plural: "is", chemicalsAnswer1: "Different wavelengths of UVR have different effects on the skin. UVA, which accounts for 95% of ultraviolet radiation, is responsible for skin aging (photoaging) and various types of skin cancers by damaging DNA. UVA penetrates the basal layer of the epidermis therefore damaging the DNA in skin cells. UVB can also cause skin cancer and gets absorbed into proteins and DNA in the skin (1). The formation of the “ozone hole” caused by depletion of stratospheric ozone has allowed further penetration of UVA and UVB and is associated with an increase in skin cancer (1).", diseasesAnswer1: "", diseasesAnswer2: "test", image: "uvr"),
             
             Item(title: "Skin Cancer", shortened: "Skin Cancer", previewText: "Skin cancer is a disease in which cells in the epidermis, the outer layer of the skin, become cancerous, due to DNA damage from various exposures.", isDisease: true, capitalize: false, plural: "is", chemicalsAnswer1: "", diseasesAnswer1: "Ultraviolet light, ionizing radiation, arsenic, and polycyclic hydrocarbons have all been proven to lead to skin cancer, though ultraviolet radiation is the most dangerous of these. The four most common types of skin cancer include basal cell carcinoma (BCC), squamous cell carcinoma (SCC), melanoma and Merkel cell carcinoma (MCC) (7).", diseasesAnswer2: "Avoiding exposure to the harmful ultraviolet rays by wearing sunscreen and avoiding other activities such as UV tanning beds reduce the chances of developing skin cancer (7). If detected in the precancerous stage, treatment options are relatively simple and leave very little scarring. The earlier the better. Daily use of sunscreen with SPF greater than 15 can reduce your risk of developing SCC and melanoma by up to 50% (11). "),
             
             Item(title: "Halogen Acne", shortened: "Halogen Acne", previewText: "Halogen acne, also known as chloracne, is acne that results from various environmental pollutants or chemical exposures (4). Unlike other forms of acne, halogen acne is almost always a sign of systemic exposure to toxic chemicals (4).", isDisease: true, capitalize: false, plural: "is", chemicalsAnswer1: "", diseasesAnswer1: "Chloracnegenic compound, or chemicals that cause halogen acne, all have similar molecular structures. This includes at least two benzene rings, with halogen atoms occupying at least three lateral ring positions forming molecular planarity (4). Development of halogen acne is usually caused by exposure through chemical manufacturing. Exposure is mainly via direct contact, but can also be through inhalation or ingestion.", diseasesAnswer2: "In most cases, halogen acne usually resolves slowly once exposure to the chemical is stopped. However, the time that this may take varies greatly and depends on the severity or degree of exposure. (4). Treatment options are limited, but some have found retinoids to be helpful in certain cases (4). Prevention for halogen acne involves preventing all opportunities for direct skin contact with chloracnegenic compounds. "),
             
             Item(title: "Irritant Contact Dermatitis (ICD)", shortened: "ICD", previewText: "Irritant Contact dermatitis (ICD) is the inflammation of the epidermis, the outer layer of the skin (9) manifested through an itchy and uncomfortable rash (9).", isDisease: true, capitalize: true, plural: "is", chemicalsAnswer1: "", diseasesAnswer1: "ICD is caused by direct damage by the irritant substance (4), as opposed to an allergic immune response. Common irritants in the environment include, solvents, plants, fertilizers/pesticides, rubbing alcohol, and bleach/detergents (9). The degree of ICD also depends on the amount of exposure and the skin type, as certain skin types, such as infant skin, are more susceptible to ICD than others (4).", diseasesAnswer2: "Cessation of exposure usually results in improvement of ICD."),
             
             Item(title: "Allergic Contact Dermatitis (ACD)", shortened: "ACD", previewText: "Allergic Contact dermatitis (ACD) is the allergic reaction to a particular substance which results in a red, itchy rash (9).", isDisease: true, capitalize: true, plural: "is", chemicalsAnswer1: "", diseasesAnswer1: "ACD is caused by contact with an allergenic substance which triggers an immune response. Common allergens include nickel (found in jewelry), plants, pollen, formaldehyde, and other preservatives in personal care products (9).", diseasesAnswer2: "To properly treat ICD or ACD, you need to identify the offending substance and avoid exposure to it."),
             
             Item(title: "Chemical Depigmentation", shortened: "Chemical Depigmentation", previewText: "Chemical depigmentation, also known as occupational vitiligo or chemical leukoderma, is the depigmentation of certain areas of the skin.", isDisease: true, capitalize: false, plural: "is", chemicalsAnswer1: "", diseasesAnswer1: "Chemical depigmentation is caused by industrial exposure to chemicals with destructive effects on epidermal melanocytes, or cells in the outer layer of skin responsible for producing melanin. Loss of melanin or the skin’s pigment, causes the skin to be more susceptible to premature skin aging and cancer (8).", diseasesAnswer2: "Treatment options for chemical depigmentation are limited. In some cases, addressing the offending chemical may result in partial repigmentation, but may take several years. (4) It is important to use sunscreen on the depigmented skin in order to protect it from ultraviolet radiation."),
             
]





//    init(title: String, shortened: String, previewText: String, isDisease: Bool, plural: String, image: String = "white", description: String  = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.") {
//        self.title = title
//        self.shortened = shortened
//        self.previewText = previewText
//        self.isDisease = isDisease
//        self.plural = plural
//        self.image = image
//        self.description = description
//        }
    
//
//    init(title: String, shortened: String, previewText: String, isDisease: Bool, plural: String, description: String  = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.") {
//        self.title = title
//        self.shortened = shortened
//        self.previewText = previewText
//        self.isDisease = isDisease
//        self.plural = plural
//        self.description = description
//        }
//
    
