import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# 데이터셋 정의
# AND, OR, XOR 논리 회로의 입력과 출력 정의
data = {
    'AND': {
        'X': np.array([[0, 0], [0, 1], [1, 0], [1, 1]]),
        'Y': np.array([[0], [0], [0], [1]])
    },
    'OR': {
        'X': np.array([[0, 0], [0, 1], [1, 0], [1, 1]]),
        'Y': np.array([[0], [1], [1], [1]])
    },
    'XOR': {
        'X': np.array([[0, 0], [0, 1], [1, 0], [1, 1]]),
        'Y': np.array([[0], [1], [1], [0]])
    }
}

# 모델 생성 함수
def create_model():
    model = Sequential()
    model.add(Dense(8, input_dim=2, activation='relu'))  # 은닉층: ReLU 활성화
    model.add(Dense(1, activation='sigmoid'))  # 출력층: Sigmoid 활성화
    model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
    return model

# 각 논리 연산에 대한 학습 및 평가
for logic_gate in data.keys():
    print(f"Training {logic_gate} gate")
    
    # 데이터 불러오기
    X = data[logic_gate]['X']
    Y = data[logic_gate]['Y']
    
    # 모델 생성 및 학습
    model = create_model()
    model.fit(X, Y, epochs=1000, verbose=0)
    
    # 평가
    _, accuracy = model.evaluate(X, Y, verbose=0)
    print(f"{logic_gate} gate accuracy: {accuracy * 100:.2f}%")
    
    # 예측 결과 확인
    predictions = model.predict(X)
    print(f"Predictions for {logic_gate} gate:\n", np.round(predictions))
    print("\n")

