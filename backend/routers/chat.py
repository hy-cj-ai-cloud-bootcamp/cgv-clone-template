"""
AI 챗봇 라우터 (스켈레톤) - CGV

[Day3 구현 가이드]
DB에서 영화/상영 정보를 가져와 Bedrock FM에 전달하여 추천하는 방식입니다.
Knowledge Base 없이 DB 데이터를 직접 프롬프트 컨텍스트로 사용합니다.

사전 준비:
- AWS CLI 설정 (aws configure)
- Bedrock 모델 접근 권한 활성화
"""
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from database import get_db
from schemas import ChatRequest, ChatResponse
from crud import get_all_movies_for_chat, get_all_schedules_for_chat
from config import AWS_REGION, BEDROCK_MODEL_ID

router = APIRouter()


@router.post("/chat", response_model=ChatResponse)
def chat(request: ChatRequest, db: Session = Depends(get_db)):
    """
    AI 영화 추천 챗봇 (AWS Bedrock)

    사용 예시:
    - "이번 주 액션 영화 뭐 있어?"
    - "2명이 볼 수 있는 오늘 저녁 상영 추천해줘"
    - "로맨스 영화 추천해줘"
    """
    user_message = request.message
    
    # [Step 1] DB에서 영화/스케줄 정보 가져오기
    movies = get_all_movies_for_chat(db)
    schedules = get_all_schedules_for_chat(db)
    
    movie_info = "\n".join([
        f"- {m.title} (장르: {m.genre}, 감독: {m.director}, 등급: {m.rating}, 상태: {m.status})"
        for m in movies
    ])
    
    schedule_info = "\n".join([
        f"- {s.movie.title} | {s.screen.theater.name} {s.screen.name} | {s.date} {s.start_time}~{s.end_time}"
        for s in schedules[:20]  # 최근 20개만
    ])

    # ============================================
    # TODO: 여기에 AWS Bedrock 연동 코드를 작성하세요
    # ============================================
    """
    import boto3
    import json
    
    client = boto3.client('bedrock-runtime', region_name=AWS_REGION)
    
    prompt = f'''당신은 CGV 영화관의 AI 추천 도우미입니다.
아래 영화 목록과 상영 스케줄을 참고하여 고객에게 영화를 추천해주세요.
장르, 상영 시간, 관람 인원 등을 고려하여 맞춤 추천을 제공합니다.

[상영 중인 영화 목록]
{movie_info}

[상영 스케줄]
{schedule_info}

[고객 질문]
{user_message}

친절한 톤으로 한국어로 답변해주세요.'''
    
    body = json.dumps({
        "anthropic_version": "bedrock-2023-05-31",
        "max_tokens": 500,
        "messages": [
            {"role": "user", "content": prompt}
        ]
    })
    
    response = client.invoke_model(
        modelId=BEDROCK_MODEL_ID,
        body=body,
        contentType='application/json'
    )
    
    result = json.loads(response['body'].read())
    reply = result['content'][0]['text']
    return ChatResponse(reply=reply)
    """
    
    # [임시 응답]
    return ChatResponse(
        reply=f"[AI 챗봇 준비 중] '{user_message}'에 대한 답변을 준비하고 있습니다. "
              f"Day3에 AWS Bedrock을 연동하면 실제 AI 추천을 받을 수 있습니다! "
              f"현재 {len(movies)}편의 영화가 등록되어 있습니다."
    )
