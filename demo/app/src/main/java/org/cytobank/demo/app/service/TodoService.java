package org.cytobank.demo.app.service;

import lombok.RequiredArgsConstructor;
import org.cytobank.demo.app.model.TodoItem;
import org.cytobank.demo.app.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author moyongfeng
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class TodoService {

  private final TodoRepository todoRepository;

  public TodoItem createTodo(String content) {
    TodoItem item = new TodoItem();
    item.setContent(content);
    item.setEnabled(true);

    todoRepository.save(item);

    return item;
  }

  public List<TodoItem> getTodoList() {
    return todoRepository.findAll();
  }

  public void toggleById(Long id) {
    TodoItem item = todoRepository.getOne(id);
    item.setEnabled(!item.isEnabled());
    todoRepository.save(item);
  }

}
