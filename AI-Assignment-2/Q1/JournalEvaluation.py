NORECORD = 'NORECORD'


class JournalEvaluation():
    def __init__(self, args):
        self.publisher = args['pu']
        self.country = args['co']
        self.category = args['ca']
        self.title = args['ti']
        self.sjr = args['sj']
        self.hindex = args['hi']
        self.allowed_type = args['ty']

    def print_rule(self):
        print('[RULE]:', self.publisher, self.country,
              self.category, self.title, self.sjr, self.hindex)

    def qualified(self, j):
        try:
            out = self.publisher in j.publisher \
                and j.country == self.country \
                and j.categories in self.category \
                and self.title in j.title \
                and float(j.sjr) >= float(self.sjr) \
                and float(j.hindex) >= float(self.hindex) \
                and j.types in self.allowed_type
        except:
            out = False
        return out
