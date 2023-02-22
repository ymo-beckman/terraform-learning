package org.cytobank.demo.app.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.cytobank.demo.app.model.TodoDto;
import org.cytobank.demo.app.model.TodoItem;
import org.cytobank.demo.app.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author moyongfeng
 */
@RestController
@Api(tags = "Todo")
@RequestMapping("/api/v1/todo")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class TodoController {

  private final TodoService todoService;

  @ApiOperation("todo list")
  @GetMapping("")
  public List<TodoItem> getTodoList() {
    return todoService.getTodoList();
  }

  @ApiOperation("new todo item")
  @PostMapping("")
  public TodoItem createTodoItem(@RequestBody TodoDto dto) {
    return todoService.createTodo(dto.getContent());
  }

  @ApiOperation("toggle")
  @PutMapping("{id}")
  public void toggleTodoItem(@PathVariable("id") long id) {
    todoService.toggleById(id);
  }

}
