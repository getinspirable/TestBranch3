public class theController {

    String searchText;
    List<Account> results;

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String s) {
        searchText = s;
    }

    public List<Account> getResults() {
        return results;
    }

    public PageReference doSearch() {
        results = (List<Account>)[FIND :searchText RETURNING Account(Name, AccountNumber, Phone)][0];
        return null;
    }
}