from pandas import read_csv

from Journal import Journal


class JournalAction:
    properties = []
    selection = 0

    def load_properties(self, csv_filepath):
        dataFrame = read_csv(csv_filepath)
        dataFrame.fillna('UNKNOWN', inplace=True)
        dataFrame.reset_index(drop=True)
        for _, row in dataFrame.iterrows():
            Journal(row)
        journal_list = Journal.journals
        return journal_list

    def change_display(self):
        try:
            properties = JournalAction.properties
            selection = JournalAction.selection
            display_message = '\nFound {} journal for you, currently displaying the {} item\n\nName: {}\tType: {}\nRank: {}\tSource id: {}\nSJR: {}\tSJR Best Quartile: {}\nIssn: {}\tH index: {}\nTotal Docs: {}\tTotal Docs in 3 Years: {}\nTotal References: {}\tTotal Citations in 3 years: {}\nCitable Docs in 3 years: {}\tImpact Factor: {}\nReferences/Docs: {}\nCountry: {}\tRegion: {}\nPublisher: {}\tCategories: {}\n'.format(
                len(properties), selection+1,
                properties[selection].title, properties[selection].types, properties[selection].rank, properties[selection].sourceid,
                properties[selection].sjr, properties[selection].sjrbest, properties[selection].issn, properties[selection].hindex,
                properties[selection].total, properties[selection].total3, properties[selection].ref, properties[selection].cites, properties[selection].cites3, properties[selection].cbd, properties[selection].rbd, properties[selection].country, properties[selection].region, properties[selection].publisher, properties[selection].categories)
            return display_message
        except:
            return 'Nothing to scroll !'

    def goto_next_property(self):
        if JournalAction.selection < len(JournalAction.properties)-1:
            JournalAction.selection += 1
        return self.change_display()

    def goto_prev_property(self):
        if JournalAction.selection > 0:
            JournalAction.selection -= 1
        return self.change_display()
