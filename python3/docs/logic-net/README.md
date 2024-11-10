source ./.venv/bin/activate
pip install numpy tensorflow

https://playground.tensorflow.org

네, 각 뉴런을 행렬로 표현하면 보다 간결하게 연산 과정을 나타낼 수 있습니다. 입력 데이터와 가중치, 편향을 모두 행렬과 벡터로 정리해 보겠습니다.

### 행렬 표현

1. **입력 벡터** \(\mathbf{x}\):
   - 입력 벡터 \(\mathbf{x}\)는 2개의 요소를 가집니다. 예를 들어, \(\mathbf{x} = \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}\)입니다.
  
2. **가중치 행렬** \(\mathbf{W}\):
   - 가중치 행렬 \(\mathbf{W}\)는 \(8 \times 2\) 크기로, 총 8개의 뉴런이 있고 각 뉴런이 2개의 입력을 받습니다.
   - 예를 들어, 가중치 행렬은 다음과 같습니다:
     \[
     \mathbf{W} = \begin{bmatrix} 
     w_{11} & w_{12} \\ 
     w_{21} & w_{22} \\ 
     \vdots & \vdots \\ 
     w_{81} & w_{82} 
     \end{bmatrix}
     \]
  
3. **편향 벡터** \(\mathbf{b}\):
   - 각 뉴런에 하나씩 편향이 있으므로 편향 벡터 \(\mathbf{b}\)는 \(8 \times 1\) 크기입니다:
     \[
     \mathbf{b} = \begin{bmatrix} b_1 \\ b_2 \\ \vdots \\ b_8 \end{bmatrix}
     \]

4. **출력 벡터** \(\mathbf{h}\):
   - 각 뉴런의 결과는 활성화 함수(ReLU)를 통과하여 최종 출력이 됩니다.
   - 출력 벡터 \(\mathbf{h}\)는 8개의 뉴런 결과를 포함하는 \(8 \times 1\) 벡터입니다:
     \[
     \mathbf{h} = \begin{bmatrix} h_1 \\ h_2 \\ \vdots \\ h_8 \end{bmatrix}
     \]

### 연산 과정

이제 이 과정을 행렬 연산으로 표현하면 다음과 같습니다.

1. **가중치와 입력의 행렬곱**:
   \[
   \mathbf{W} \cdot \mathbf{x} = \begin{bmatrix} 
   w_{11} & w_{12} \\ 
   w_{21} & w_{22} \\ 
   \vdots & \vdots \\ 
   w_{81} & w_{82} 
   \end{bmatrix} 
   \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = 
   \begin{bmatrix} z_1 \\ z_2 \\ \vdots \\ z_8 \end{bmatrix}
   \]

2. **편향 더하기**:
   \[
   \mathbf{W} \cdot \mathbf{x} + \mathbf{b} = \begin{bmatrix} z_1 + b_1 \\ z_2 + b_2 \\ \vdots \\ z_8 + b_8 \end{bmatrix}
   \]

3. **활성화 함수 적용**:
   - 각 요소에 ReLU 활성화 함수를 적용합니다:
     \[
     \mathbf{h} = \text{ReLU}(\mathbf{W} \cdot \mathbf{x} + \mathbf{b}) = \begin{bmatrix} \max(0, z_1 + b_1) \\ \max(0, z_2 + b_2) \\ \vdots \\ \max(0, z_8 + b_8) \end{bmatrix}
     \]

이 행렬 표현으로 모든 뉴런의 연산 과정을 한 번에 계산할 수 있어, 딥러닝에서는 효율적이고 직관적인 표현 방법입니다.