package org.cytobank.demo.app.repository;

import org.cytobank.demo.app.model.TodoItem;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author moyongfeng
 */
public interface TodoRepository extends JpaRepository<TodoItem, Long> {
}
