package org.cytobank.demo.app.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * @author moyongfeng
 */
@Data
@Entity
@Table(
    schema = "public", name = "todo"
)
public class TodoItem {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "todoSeq")
  @SequenceGenerator(name = "todoSeq", allocationSize = 1, sequenceName = "TODO_SEQUENCE", schema = "public")
  @Column(name = "n_id")
  long id;

  @Column(name = "content")
  String content;

  @Column(name = "enabled")
  boolean enabled;

}
