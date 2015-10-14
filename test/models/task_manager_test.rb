require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({:title       => 'My title',
                        :description => 'get stuff done'})
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal 'My title', task.title
    assert_equal 'get stuff done', task.description
  end

  def test_it_can_find_the_correct_task
    TaskManager.create({:title       => 'My title',
                        :description => 'get stuff done'})
    TaskManager.create({:title       => 'second title',
                        :description => 'not getting things done'})
    TaskManager.create({:title       => 'third title',
                        :description => 'back?'})
    task = TaskManager.find(2)

    assert_equal 2, task.id
    assert_equal 'second title', task.title
    assert_equal 'not getting things done', task.description
  end

  def test_it_can_find_all_tasks
    TaskManager.create({:title       => 'My title',
                        :description => 'get stuff done'})
    TaskManager.create({:title       => 'second title',
                        :description => 'not getting things done'})
    tasks = TaskManager.all

    assert_equal 1, tasks[0].id
    assert_equal 'My title', tasks[0].title
    assert_equal 'get stuff done', tasks[0].description
    assert_equal 2, tasks[1].id
    assert_equal 'second title', tasks[1].title
    assert_equal 'not getting things done', tasks[1].description
  end

  def test_it_can_update_a_previously_added_task
    TaskManager.create({:title       => 'My title',
                        :description => 'get stuff done'})
    TaskManager.update(1, {:title       => 'My Second title',
                           :description => 'not getting things done'})
    task = TaskManager.find(1)

    assert_equal 'My Second title', task.title
    assert_equal 'not getting things done', task.description
  end

  def test_it_can_delete_a_previously_added_task
    TaskManager.create({:title       => 'My title',
                        :description => 'get stuff done'})
    TaskManager.create({:title       => 'second title',
                        :description => 'not getting things done'})
    TaskManager.delete(1)
    tasks = TaskManager.all

    assert_equal 2, tasks[0].id
    assert_equal 'second title', tasks[0].title
    assert_equal nil, tasks[1]
  end
end
