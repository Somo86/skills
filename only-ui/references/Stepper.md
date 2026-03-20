# Stepper

## Use when

- The design represents progress through a multi-step wizard or process.

## Figma mapping cues

- Sequential numbered progress steps with current/completed states -> `Stepper`

## Implementation notes

- Compose as `Stepper -> Stepper.Navigation -> Stepper.Step`.
- `useStepper()` can be used inside the `Stepper` subtree to access `currentStep`, `jumpTo`, `next`, and `previous`.
- Controlled mode uses `step` and `onStepChange`.
- `Stepper.Step` supports `completed`, `disabled`, and `Stepper.Step.Subtitle`.

## React examples

```tsx
import { Stepper } from '@onlyfyio/oui';

export function Example() {
  return (
    <Stepper>
      <Stepper.Navigation>
        <Stepper.Step>Step 1</Stepper.Step>
        <Stepper.Step>Step 2</Stepper.Step>
        <Stepper.Step>Step 3</Stepper.Step>
      </Stepper.Navigation>
    </Stepper>
  );
}
```

```tsx
import { Button, Stepper } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [step, setStep] = useState(0);

  return (
    <>
      <Stepper step={step} onStepChange={setStep}>
        <Stepper.Navigation>
          <Stepper.Step completed>Step 1</Stepper.Step>
          <Stepper.Step>
            Step 2
            <Stepper.Step.Subtitle>Subtitle</Stepper.Step.Subtitle>
          </Stepper.Step>
          <Stepper.Step disabled>Step 3</Stepper.Step>
        </Stepper.Navigation>
      </Stepper>
      <div style={{ display: 'flex', gap: 8, marginTop: 8 }}>
        <Button variant="secondary" onClick={() => setStep(Math.max(0, step - 1))}>
          Previous
        </Button>
        <Button variant="primary" onClick={() => setStep(Math.min(2, step + 1))}>
          Next
        </Button>
      </div>
    </>
  );
}
```

## Prefer over raw HTML when

- You would otherwise implement a wizard progress indicator and step-state logic manually.

## Avoid when

- The design uses tabs rather than a sequential process.

## Sources

- `packages/oui/src/components/Stepper/Stepper.stories.mdx`
