package ua.contactbook.dao;

import ua.contactbook.domain.Group;
import java.util.List;

public interface GroupDAO {
    void add(Group group);
    void delete(Group group);
    Group findOne(long id);
    List<Group> list();
}
