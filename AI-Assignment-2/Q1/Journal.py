import math

NORECORD = 'NORECORD'


class Journal:
    journals = []
    Categories = set()
    Country = set()
    Publisher = set()

    def __init__(self, data):
        self.title = data.Title
        self.types = data.Type
        self.rank = data.Rank
        self.issn = data.Issn
        self.sourceid = data.Sourceid
        self.sjr = data.SJR
        self.sjrbest = data.SJR_Best_Quartile
        self.hindex = data.H_index
        self.total = data.Total_Docs
        self.total3 = data.Total_Docs_3years
        self.ref = data.Total_Refs
        self.cites = data.Total_Cites_3years
        self.cites3 = data.Citable_Docs_3years
        self.cbd = data.Cites_by_Doc
        self.rbd = data.Ref_by_Doc
        self.country = data.Country
        self.region = data.Region
        self.publisher = data.Publisher
        self.categories = data.Categories
        if data.Issn == '-':
            self.issn = NORECORD
        temp = ""
        for k in data.Issn:
            if k == '.':
                temp += ','
        self.issn = temp
        if data.SJR_Best_Quartile == '-':
            self.sjrbest = NORECORD
        Journal.Country.add(self.country)
        Journal.Publisher.add(self.publisher)
        self.categories = self.categories.rstrip()
        Journal.Categories.add(self.categories)
        Journal.journals.append(self)
