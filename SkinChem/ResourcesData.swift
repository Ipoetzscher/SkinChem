//
//  DataResources.swift
//  TestApp
//
//  Created by India Poetzscher on 4/4/22.
//

import SwiftUI

struct Resource: Identifiable {
    var id = UUID()
    var articleTitle: String
    var link: String
}

var resources = [Resource(articleTitle: "Resource 1", link: "https://www.frontiersin.org/articles/10.3389/fenvs.2014.00011/full#:~:text=Conclusions-,Major%20air%20pollutants%20with%20effects%20on%20the%20skin%20include%20the,cancer%2C%20psoriasis%2C%20and%20acne"),
                 Resource(articleTitle: "Resource 2", link: "https://www.sciencedirect.com/science/article/abs/pii/S0045653520311486"),
                 Resource(articleTitle: "Resource 3", link: "https://www.atsdr.cdc.gov/csem/polycyclic-aromatic-hydrocarbons/health_effects.html"),
                 Resource(articleTitle: "Resource 4", link: "https://academic.oup.com/bmb/article/68/1/129/421238"),
                 Resource(articleTitle: "Resource 5", link: "https://ijdvl.com/effects-of-air-pollution-on-the-skin-a-review/#ref7"),
                 Resource(articleTitle: "Resource 6", link: "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0119501"),
                 Resource(articleTitle: "Resource 7", link: "https://www.skincancer.org/skin-cancer-information/"),
                 Resource(articleTitle: "Resource 8", link: "https://pubmed.ncbi.nlm.nih.gov/15140065/"),
                 Resource(articleTitle: "Resource 9", link: "https://www.mayoclinic.org/diseases-conditions/contact-dermatitis/symptoms-causes/syc-20352742#:~:text=Allergic%20contact%20dermatitis%20occurs%20when,into%20contact%20with%20the%20allergen"),
                 Resource(articleTitle: "Resource 10", link: "https://www.cdc.gov/nceh/features/uv-radiation-safety/index.html"),
                 Resource(articleTitle: "Resource 11", link: "https://www.skincancer.org/skin-cancer-prevention/sun-protection/sunscreen/")
]


var secondResources = [Resource(articleTitle: "Centers for Disease Control", link: "https://www.cdc.gov/cancer/skin/index.htm"),
                       Resource(articleTitle: "Environmental Protection Agency", link: "https://www.epa.gov/environmental-topics/chemicals-and-toxics-topics"),
                       Resource(articleTitle: "National Institues of Health", link: "https://www.niams.nih.gov/health-topics/skin-diseases")]

var thirdResources = [Resource(articleTitle: "Understanding the harmful effects of chemicals all around us is the only way to protect our skin from developing these skin diseases. Although the skin acts as a barrier to the host of damaging environmental chemicals, repeated or prolonged exposure will overpower the skin's natural defense mechanisms, thus we must be aware of the risks we face.", link: "https://www.apple.com/")]
