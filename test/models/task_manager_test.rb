require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({:title       => "My title",
                        :description => "get stuff done"})
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "My title", task.title
    assert_equal "get stuff done", task.description
  end

  def test_it_can_delete_a_previously_added_task
    TaskManager.create({:title       => "My title",
                        :description => "get stuff done"})
    TaskManager.create({:title       => "second title",
                        :description => "not getting things done"})
    TaskManager.delete(1)
    tasks = TaskManager.all
    assert_equal 2, tasks[0].id
    assert_equal "second title", tasks[0].title
    assert_equal nil, tasks[1]
  end
end
