## Solution classes diagram

```mermaid
  flowchart LR
    main.rb --> Calculator
    main.rb --> InputParser
    InputParser --> Item
    Item --> Category
    Calculator --> BasicSalesTax
    Calculator --> ImportDuty
    Calculator --> Receipt
    main.rb --> Printer
```
