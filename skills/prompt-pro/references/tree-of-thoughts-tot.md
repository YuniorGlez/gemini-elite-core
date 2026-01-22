# Tree-of-Thoughts (ToT) Prompting (2026)

Tree-of-Thoughts allows LLMs to explore multiple reasoning paths simultaneously, backtracking when a branch leads to a dead end.

## 1. The Core Structure

1.  **Thought Generation**: Propose multiple initial ideas for solving the problem.
2.  **State Evaluation**: Evaluate each idea based on its viability and potential.
3.  **Search Algorithm**: Deepen the most promising ideas (Depth-First or Breadth-First).

## 2. Implementation Prompt

```text
Problem: [Insert complex problem]

1. Generate 3 distinct strategies to solve this.
2. For each strategy, identify one critical flaw.
3. Eliminate the strategy with the most severe flaw.
4. For the remaining strategies, generate 2 sub-steps each.
5. Synthesize the final solution by merging the best elements of the remaining paths.
```

## 3. When to Use ToT

-   **Creative Coding**: Designing novel algorithms.
-   **Strategic Planning**: Evaluating market moves or product roadmaps.
-   **Complex Debugging**: Finding race conditions that span multiple systems.

## 4. Evaluation Criteria

Ask the model to act as a "Judge" for its own thoughts:
-   `Confidence Score`: 1-10.
-   `Reasoning Gap`: What information is still missing?
-   `Simulated Outcome`: What happens if we execute this path?

## 5. Merging Branches

Final synthesis is the most important step. Ensure the model doesn't just pick one branch, but **integrates** the learnings from all explored paths.

---
*Updated: January 22, 2026 - 20:55*
