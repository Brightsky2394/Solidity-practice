// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        Todo memory todo = Todo({text: _text, completed: false});
        todos.push(todo);
    }

    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;
    }

    function toggleCompleted(uint _index) external {
        bool checked = todos[_index].completed;
        todos[_index].completed = !checked;
    }

    function get(uint _index) external view returns (Todo memory) {
        return todos[_index];
    }

    function returnTodoList() external view returns (Todo[] memory) {
        return todos;
    }

    function returnLength() external view returns (uint) {
        return todos.length;
    }
}
